import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget{
  final String? title;
  final Color color;

  MyAppbar({super.key, this.title, this.color = Colours.main});

  @override
  State<MyAppbar> createState() => _MyAppbarState();


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppbarState extends State<MyAppbar>  {

  final player = AudioPlayer();
  var isPlayedAudio = false;

  @override
  void initState() {
    super.initState();
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          isPlayedAudio = false;
        });
      }
    });
  }

  void playAudio() async {
    await player.setAsset("assets/audios/first.mp3");
    await player.setVolume(1.0);
    await player.play();
  }

  void stopAudio() async {
    await player.stop();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.color,
      title: widget.title != null ? Text(widget.title!, style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontSize: size.width >= 740 ? 25 : size.width >= 660 ? 22 : 18)) : null,
      actions: [
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            onPressed: () {
              if (isPlayedAudio) {
                stopAudio();
              } else {
                playAudio();
              }
              setState(() {
                isPlayedAudio = !isPlayedAudio;
              });
            },
            icon: Icon(isPlayedAudio ? CupertinoIcons.speaker_slash  : CupertinoIcons.speaker_2 , color: Colours.white, size: 30,)),
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
    );
  }

}
