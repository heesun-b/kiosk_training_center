
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/start/widgets/title_container.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final player = Player();
  final appbarPlayer = Player();
  var isAppbarPlayedAudio = false;

  @override
  void initState() {
    super.initState();
    appbarPlayer.handle.whenComplete(() {
      setState(() {
          isAppbarPlayedAudio = false;
      });
    });
    // appbarPlayer.playerStateStream.listen((playerState) {
    //   if (playerState.processingState == ProcessingState.completed) {
    //     setState(() {
    //       isAppbarPlayedAudio = false;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    player.dispose();
    appbarPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.main,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colours.main,
        title: const Padding(
          padding: EdgeInsets.only(top: 17, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Text("음성 안내가 필요하다면 헤드셋을 낀 뒤 스피커 모양을 눌러주세요."),
            ],
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: MyTextStyle.dungGeunMo, color: Colours.white, fontSize: size.width * 0.015),
        actions: [
          IconButton(

              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              onPressed: () {
                if (isAppbarPlayedAudio) {
                  appbarStopAudio();
                } else {
                  appbarPlayAudio();
                }
                setState(() {
                  isAppbarPlayedAudio = !isAppbarPlayedAudio;
                });
              },
              icon: Icon(isAppbarPlayedAudio ? CupertinoIcons.speaker_slash  : CupertinoIcons.speaker_2 , color: Colours.white, size: size.width * 0.025,)),
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colours.red,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
            ),
            child: const Text("HALL 1", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: 15, fontWeight: FontWeight.w800), textAlign: TextAlign.center,),
          )
        ],
        shape: const Border(
          top: BorderSide(color: Colours.red, width: 5),
        ),
        toolbarHeight: 45.0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(child: TitleContainer(text: "KIOSK",)),
              const FittedBox(child: TitleContainer(text: "TRAINING CENTER"),
              ),
              Text("키오스크 트레이닝 센터", style: TextStyle(color: Colours.sky, fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width >= CriteriaSize.widthSize1 ? 65 : size.width >= CriteriaSize.widthSize2 ? 55 : 45)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  playAudio();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colours.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colours.grey,
                        offset: Offset(-1, 5)
                      )
                    ]
                  ),
                  child: Text("입장하기", style: TextStyle(color: Colours.brown, fontFamily: MyTextStyle.computersetak, fontWeight: FontWeight.w800, fontSize: size.width >= CriteriaSize.widthSize1 ? 20 : size.width >= CriteriaSize.widthSize2 ? 18 : 15),textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void playAudio() async {

    if (player.state.playing) {
      await player.stop();
    }

    await loadAssetAndPlay('assets/audios/click.mp3', player);
    // await player.setAsset("assets/audios/click.mp3");
    await player.setVolume(100.0);
    await player.play();

    player.handle.whenComplete(() => GoRouter.of(context).goNamed("select_people_and_method"));
    // player.playerStateStream.listen((playerState) {
    //   if (playerState.processingState == ProcessingState.completed) {
    //     GoRouter.of(context).goNamed("select_people_and_method");
    //   }
    // });
  }

  void stopAudio() async {
    await player.stop();
  }

  void appbarPlayAudio() async {
    await loadAssetAndPlay('assets/audios/first.mp3', appbarPlayer);
    // await appbarPlayer.setAsset("assets/audios/first.mp3");
    await appbarPlayer.setVolume(100.0);
    await appbarPlayer.play();
  }

  void appbarStopAudio() async {
    await appbarPlayer.stop();
  }

  Future<void> loadAssetAndPlay(String path, Player player) async {
    // assets/audio/first.mp3 파일을 ByteData로 읽기
    ByteData data = await rootBundle.load(path);
    // 임시 디렉토리에 파일 저장
    Directory tempDir = await getTemporaryDirectory();

    String lastPart = path.split('/').last;
    File tempFile = File('${tempDir.path}/$lastPart');

    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

    // 저장된 파일을 재생
    await player.open(Media(tempFile.path));
  }
}
