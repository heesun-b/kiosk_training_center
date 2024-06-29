// import 'package:flutter/material.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:provider/provider.dart';
//
// class MenuButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;
//   final bool selected;
//
//   const MenuButton({super.key, required this.onTap, required this.text, required this.selected});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MenuProvider>(
//       builder: (context, provider, child) {
//         return GestureDetector(
//           onTap: onTap,
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//             width: selected ? 100 : 90, // 선택됐을 때의 크기와 비선택됐을 때의 크기
//             height: selected ? 70 : 40,
//             decoration: BoxDecoration(
//               color: selected ? Colours.blue : Colours.beige,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colours.blue, width: 2)
//             ),
//             child: Center(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   fontFamily: 'Pretendard',
//                   color: Colours.black,
//                   fontSize: selected ? 20 : 15,
//                   fontStyle: selected ? FontStyle.italic : FontStyle.normal,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
