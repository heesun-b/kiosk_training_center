
import 'dart:async';

import 'package:media_kit/media_kit.dart';


class SelectPeopleAndMethodState {
  var count = 0;
  var selected = false;

  DateTime currentTime = DateTime.now();
  Timer timer = Timer(const Duration(seconds: 1), () {});
  Player player = Player();
  Player player2 = Player();
  var isPlayedAudio = false;
  var isPlayedAudio2 = false;
}