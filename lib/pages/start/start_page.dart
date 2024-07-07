import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/start/widgets/title_container.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final player = AudioPlayer();
  final appbarPlayer = AudioPlayer();
  var isAppbarPlayedAudio = false;

  @override
  void initState() {
    super.initState();

    appbarPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          isAppbarPlayedAudio = false;
        });
      }
    });
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
        actions: [
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              icon: Icon(isAppbarPlayedAudio ? CupertinoIcons.speaker_slash  : CupertinoIcons.speaker_2 , color: Colours.white, size: 30,)),
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
                    color: Colours.main,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colours.pinkGrey,
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
    if (player.playing) {
      await player.stop();
    }

    await player.setAsset("assets/audios/click.mp3");
    await player.setVolume(1.0);
    await player.play();

    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        GoRouter.of(context).goNamed("select_people_and_method");
      }
    });
  }

  void stopAudio() async {
    await player.stop();
  }

  void appbarPlayAudio() async {
    await appbarPlayer.setAsset("assets/audios/first.mp3");
    await appbarPlayer.setVolume(1.0);
    await appbarPlayer.play();
  }

  void appbarStopAudio() async {
    await appbarPlayer.stop();
  }
}
