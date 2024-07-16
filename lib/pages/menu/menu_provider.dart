import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/dto/work.dart';
import 'package:kiosk_training_center/pages/menu/menu_state.dart';
import 'dart:ui' as ui;

class MenuProvider extends ChangeNotifier {
  MenuState state = MenuState();

  void init(int peopleCount) {
    state.peopleCount = peopleCount;
    state.cartList = [];
    state.currentPage = 0;

    ///
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

    notifyListeners();
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
  
  void addCart(Author author, Work work) {

    var cart = Cart(
        authorName: author.name,
        workName: work.krName,
        workImage: work.imagePath,
        workVideo: work.videoPath,
        caption: work.caption,
        price: 3);

    var contained = state.cartList.where((element) => element.workName == cart.workName);

    if(contained.isEmpty) {
      state.cartList.add(cart);
    }

     notifyListeners();
  }

  bool checkCart (Work work) {
   var count = state.cartList.where((element) => element.workName == work.krName).length;
   return count > 0 ? true : false;
  }

  void deleteCart(int index) {
    state.cartList.removeAt(index);
    notifyListeners();
  }

  int countCartList(String menu) {
      var sameList = state.cartList.where((element) => element.authorName == menu).toList();
      return sameList.length;
  }

  void reorderCart(int oldIndex, int newIndex) {
    // if (newIndex > oldIndex) {
    //   newIndex -= 1;
    // }
    final item = state.cartList.removeAt(oldIndex);
    state.cartList.insert(newIndex, item);
    notifyListeners();
  }

  void nextPaymentStep() {
    state.currentPaymentStep = state.currentPaymentStep +1;
    notifyListeners();
  }

  void clickedPaymentFirstButton() {
    state.clickedFirstStep = !state.clickedFirstStep;
    notifyListeners();
  }

  void saveSign(ui.Image sign) {
    state.signImage = sign;
    notifyListeners();
  }
}