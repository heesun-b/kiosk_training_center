import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_state.dart';

class SelectPeopleAndMethodProvider extends ChangeNotifier {
  final state = SelectPeopleAndMethodState();

  void init() {
    state.count = 0;
    state.selected = false;

    state.currentTime = DateTime.now();
    state.timer = Timer(const Duration(seconds: 1), () => _updateTime());
    state.player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        state.isPlayedAudio = false;
        notifyListeners();
      }
    });

    notifyListeners();
  }

  void add() {
    state.count++;
    notifyListeners();
  }

  void minus() {
    if(state.count > 0) state.count--;
    notifyListeners();
  }

  void changeSelect(BuildContext context) {
    state.selected = !state.selected;
    notifyListeners();

    if(state.selected && state.count > 0) {
      state.player.stop();
      state.isPlayedAudio = false;
      GoRouter.of(context).pushNamed("menu", extra: state.count);
    }
  }

  void _updateTime() {
     state.currentTime = DateTime.now();
     notifyListeners();
  }

  Future<void> playAudio(String audioPath) async {
    state.isPlayedAudio = !state.isPlayedAudio;

    if(!state.isPlayedAudio) {
      await state.player.stop();
    } else {
      await state.player.setAsset(audioPath);
      await state.player.setVolume(1.0);
      await state.player.play();
    }
  }

  void baseDispose() {
    state.timer.cancel();
    state.player.dispose();
  }
}