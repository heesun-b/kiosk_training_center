import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/pages/menu/menu_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_state.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';

class SelectPeopleAndMethodProvider extends ChangeNotifier {
  SelectPeopleAndMethodState state = SelectPeopleAndMethodState();

  void init() {
    state.count = 0;
    state.selected = false;

    state.currentTime = DateTime.now();
    state.timer = Timer(const Duration(seconds: 1), () => _updateTime());
    state.player.handle.whenComplete(() {
      state.isPlayedAudio = false;
      notifyListeners();
    });

    state.player2.handle.whenComplete(() {
      state.isPlayedAudio2 = false;
      notifyListeners();
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
      state.isPlayedAudio2 = false;
      notifyListeners();
      GoRouter.of(context).goNamed("menu", extra: state.count);
      // GoRouter.of(context).replaceNamed("menu", extra: state.count);
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

      await loadAssetAndPlay(audioPath);
      // await state.player.setAsset(audioPath);
      await state.player.setVolume(100.0);
      await state.player.play();
    }
    notifyListeners();
  }

  Future<void> playAudio2() async {
    state.isPlayedAudio2 = !state.isPlayedAudio2;

    if(!state.isPlayedAudio2) {
      await state.player2.stop();
    } else {

      await loadAssetAndPlay('assets/audios/bell.mp3');
      // await state.player2.setAsset('assets/audios/bell.mp3');
      await state.player2.setVolume(100.0);
      await state.player2.play();
    }
    notifyListeners();
  }

  void baseDispose() {
    state.timer.cancel();
    state.player.dispose();
    state.player2.dispose();
  }

  Future<void> loadAssetAndPlay(String path) async {
    // assets/audio/first.mp3 파일을 ByteData로 읽기
    ByteData data = await rootBundle.load(path);
    // 임시 디렉토리에 파일 저장
    Directory tempDir = await getTemporaryDirectory();
    String lastPart = path.split('/').last;
    File tempFile = File('${tempDir.path}/$lastPart');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

    // 저장된 파일을 재생
    await state.player.open(Media(tempFile.path));
  }
}