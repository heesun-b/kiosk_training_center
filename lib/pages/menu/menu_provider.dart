import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_training_center/pages/menu/menu_state.dart';

class MenuProvider extends ChangeNotifier {
  final state = MenuState();

  void init() {
    state.scrollController1.addListener(() {
      if (state.scrollController1.position.atEdge) {
        bool isTop = state.scrollController1.position.pixels == 0;
        if (!isTop) {
          state.pageController.nextPage(
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        } else {
          state.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
        }
      }
    });

    state.scrollController2.addListener(() {
      if (state.scrollController2.position.atEdge) {
        bool isTop = state.scrollController2.position.pixels == 0;
        if (!isTop) {
          state.pageController.nextPage(
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        } else {
          state.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
        }
      }
    });

    state.scrollController3.addListener(() {
      if (state.scrollController3.position.atEdge) {
        bool isTop = state.scrollController3.position.pixels == 0;
        if (!isTop) {
          state.pageController.nextPage(
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        } else {
          state.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
        }
      }
    });


  }

  void navigateToPage(int page) {
    state.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void selectPage(int page) {
    state.currentPage = page;
    notifyListeners();
  }

  Future<String> loadAsset(String authorInfo) async {
    return await rootBundle.loadString(authorInfo);
  }
}