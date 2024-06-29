// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:kiosk_training_center/pages/menu/widgets/cart_area.dart';
// import 'package:kiosk_training_center/pages/menu/widgets/menu_button.dart';
// import 'package:kiosk_training_center/pages/menu/widgets/scrollable_page.dart';
// import 'package:provider/provider.dart';
//
// class MenuPage extends StatefulWidget {
//   const MenuPage({super.key});
//
//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> {
//
//   final provider = MenuProvider();
//
//   @override
//   void initState() {
//     super.initState();
//     provider.init();
//   }
//
//   @override
//   void dispose() {
//     provider.state.pageController.dispose();
//     provider.state.scrollController0.dispose();
//     provider.state.scrollController1.dispose();
//     provider.state.scrollController2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//         value: provider,
//         builder: (context, child) => _buildPage(context));
//   }
// }
//
//
// Widget _buildPage(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colours.beige,
//     body: SafeArea(
//       child: Consumer<MenuProvider>(
//         builder: (context, provider, child) {
//           return Column(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: List.generate(
//                             provider.state.author.length,
//                                 (index) => Column(
//                                   children: [
//                                     MenuButton(
//                                       text: provider.state.author[index].name,
//                                       onTap: () => provider.navigateToPage(index),
//                                       selected: index == 0 ? provider.state.selectedFirstPage : index == 1 ? provider.state.selectedSecondPage : provider.state.selectedThirdPage,
//                                     ),
//                                     const SizedBox(height: 5),
//                                   ],
//                                 ),),
//                       ),
//                     ),
//                     Expanded(
//                       child: PageView(
//                         physics: BouncingScrollPhysics(),
//                         controller: provider.state.pageController,
//                         scrollDirection: Axis.vertical,
//                         onPageChanged: (value) => provider.selectPage(value),
//                         children: List.generate(
//                             provider.state.author.length,
//                                 (index) => ScrollablePage(
//                                   name: provider.state.author[index].name,
//                                   scrollController: index == 0 ? provider.state.scrollController0 : index == 1 ?  provider.state.scrollController1 : provider.state.scrollController2,
//                                   authorInfo: provider.state.author[index].infoPath,
//                                   works: provider.state.author[index].works,
//                                 ),),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               CartArea()
//             ],
//           );
//         },
//       ),
//     ),
//   );
// }
//
