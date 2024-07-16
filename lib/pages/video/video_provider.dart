import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/menu/menu_state.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_state.dart';
import 'package:kiosk_training_center/pages/video/video_page_state.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';

class VideoProvider extends ChangeNotifier {
  VideoPageState state = VideoPageState();

  void init(List<Cart> list) {
    state.cartList = list;
    state.initialized = true;
    notifyListeners();
  }


  void addController() {
    if (state.cartList.isNotEmpty && !state.clickedScreen) {
      state.controller =  VideoController(state.player);
      state.player.open(Media(state.cartList[state.currentIndex].workVideo));
      state.controller.player.play();
      // state.controller = VideoController.networkUrl(Uri.parse(state.cartList[state.currentIndex].workVideo))
      //   ..initialize().then((_) {
      //     state.controller.play();
      //   });
    }
  }

  void clickedScreen() {
    state.clickedScreen = !state.clickedScreen;
    state.clickedIconButton = false;
    if(state.clickedScreen) {
      state.controller.player.pause();
    } else{
      state.controller.player.play();
    }

    notifyListeners();
  }

  void clickedIconButton() {
    state.clickedIconButton = true;
    notifyListeners();
  }

  void continueVideo() {
    state.controller.player.play();
    state.clickedScreen = false;
    state.clickedIconButton = false;
    notifyListeners();
  }

  void nextVideo() {
      state.clickedScreen = false;
      state.clickedIconButton = false;
      state.currentIndex = state.currentIndex + 1;
      state.initialized = false;
      // state.controller = VideoPlayerController.networkUrl(Uri.parse(state.cartList[state.currentIndex].workVideo))
      //   ..initialize().then((_) {
      //     state.controller.play();
      //   });

      state.player.open(Media(state.cartList[state.currentIndex].workVideo));
      state.controller.player.play();
      Future.delayed(const Duration(milliseconds: 100), () {
        state.initialized = true;
        notifyListeners();
      });
      notifyListeners();
  }

  void endVideo(BuildContext context) {
    state.player.dispose();
    state = VideoPageState();
    var menuProvider = Provider.of<MenuProvider>(context, listen: false);
    menuProvider.state = MenuState();
    var selectPeopleAndMethodProvider = Provider.of<SelectPeopleAndMethodProvider>(context, listen: false);
    selectPeopleAndMethodProvider.state = SelectPeopleAndMethodState();
    context.replace('/');
  }
}

