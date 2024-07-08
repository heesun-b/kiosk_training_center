
import 'dart:async';

import 'package:just_audio/just_audio.dart';

class SelectPeopleAndMethodState {
  var count = 0;
  var selected = false;

  DateTime currentTime = DateTime.now();
  Timer timer = Timer(const Duration(seconds: 1), () {});
  AudioPlayer player = AudioPlayer();
  AudioPlayer player2 = AudioPlayer();
  var isPlayedAudio = false;
  var isPlayedAudio2 = false;
}