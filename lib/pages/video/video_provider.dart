import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/menu/menu_state.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_state.dart';
import 'package:kiosk_training_center/pages/video/video_state.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  VideoState state = VideoState();

  void init(List<Cart> list) {
    state.cartList = list;
    state.initialized = true;
    notifyListeners();
  }

  void addController() {
    if (state.cartList.isNotEmpty && !state.clickedScreen) {
      state.controller = VideoPlayerController.networkUrl(Uri.parse(state.cartList[state.currentIndex].workVideo))
        ..initialize().then((_) {
          state.controller.play();
        });
    }
  }

  void clickedScreen() {
    state.clickedScreen = !state.clickedScreen;
    state.clickedIconButton = false;
    if(state.clickedScreen) {
      state.controller.pause();
    } else{
      state.controller.play();
    }

    notifyListeners();
  }

  void clickedIconButton() {
    state.clickedIconButton = true;
    notifyListeners();
  }

  void continueVideo() {
    state.controller.play();
    state.clickedScreen = false;
    state.clickedIconButton = false;
    notifyListeners();
  }

  void nextVideo() {
      state.clickedScreen = false;
      state.clickedIconButton = false;
      state.currentIndex = state.currentIndex + 1;
      state.initialized = false;
      state.controller = VideoPlayerController.networkUrl(Uri.parse(state.cartList[state.currentIndex].workVideo))
        ..initialize().then((_) {
          state.controller.play();
        });
      Future.delayed(const Duration(milliseconds: 100), () {
        state.initialized = true;
        notifyListeners();
      });
      notifyListeners();
  }

  void endVideo(BuildContext context) {
    state = VideoState();
    var menuProvider = Provider.of<MenuProvider>(context, listen: false);
    menuProvider.state = MenuState();
    var selectPeopleAndMethodProvider = Provider.of<SelectPeopleAndMethodProvider>(context, listen: false);
    selectPeopleAndMethodProvider.state = SelectPeopleAndMethodState();
    context.replace('/');
  }
}