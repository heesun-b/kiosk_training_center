// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kiosk_training_center/pages/menu_v1/menu_state_v1.dart';
//
// class MenuProvider extends ChangeNotifier{
//   final state = MenuStateV1();
//
//   void init() {
//     state.scrollController0.addListener(() {
//       if (state.scrollController0.position.atEdge) {
//         bool isTop = state.scrollController0.position.pixels == 0;
//         if (!isTop) {
//           state.pageController.nextPage(
//               duration: const Duration(milliseconds: 300), curve: Curves.ease);
//         }
//       }
//     });
//
//     state.scrollController1.addListener(() {
//       if (state.scrollController1.position.atEdge) {
//         bool isTop = state.scrollController1.position.pixels == 0;
//         if (!isTop) {
//           state.pageController.nextPage(
//               duration: const Duration(milliseconds: 300), curve: Curves.ease);
//         }
//       }
//     });
//   }
//
//   void navigateToPage(int page) {
//     state.pageController.animateToPage(
//       page,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.ease,
//     );
//   }
//
//   void selectPage(int value) {
//     state.currentPage = value;
//
//     if(value == 0) {
//       state.selectedFirstPage = true;
//       state.selectedSecondPage = false;
//       state.selectedThirdPage = false;
//     } else if (value == 1) {
//       state.selectedFirstPage = false;
//       state.selectedSecondPage = true;
//       state.selectedThirdPage = false;
//     } else {
//       state.selectedFirstPage = false;
//       state.selectedSecondPage = false;
//       state.selectedThirdPage = true;
//     }
//     notifyListeners();
//   }
//
//   Future<String> loadAsset(String authorInfo) async {
//     return await rootBundle.loadString(authorInfo);
//   }
// }