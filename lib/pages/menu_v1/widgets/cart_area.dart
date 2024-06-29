// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:provider/provider.dart';
//
// class CartArea extends StatelessWidget {
//   const CartArea({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Container(
//       width: double.infinity,
//       height: size.width >= 800 ? 80 : 70,
//       color: Colours.blue,
//       alignment: Alignment.bottomCenter,
//       child: Row(
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 color: Colours.beige,
//                 child: Row(
//                   children: [
//                     Row(
//                       children: [
//                         Icon(CupertinoIcons.cart, color: Colours.blue, size: size.width >= 800 ? 50 : 40),
//                         const SizedBox(width: 20),
//                         Text("장바구니", style: TextStyle(color: Colours.blue,
//                             fontFamily: 'Pretendard',
//                             fontWeight: FontWeight.w800,
//                             fontSize: size.width >= 800 ? 30 : 20),)
//                       ],
//                     ),
//                     Consumer<MenuProvider>(
//                       builder: (context, provider, child) {
//                         return Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: List.generate(provider.state.author.length,
//                                 (index) {
//                                   if(provider.state.author.length -1 != index) {
//                                     return Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text('${provider.state.author[index].name} 0개 ', style: TextStyle(fontSize: size.width >= 800 ? 20 : 18, fontFamily: 'Pretendard', fontWeight: FontWeight.w800)),
//                                          SizedBox(width: size.width >= 800 ? 20 : 10),
//                                         const Text('/', style: const TextStyle(fontSize: 20, fontFamily: 'Pretendard', fontWeight: FontWeight.w800)),
//                                          SizedBox(width: size.width >= 800 ? 20 : 10),
//                                       ],
//                                     );
//                                   }
//
//                                   return  Text('${provider.state.author[index].name}  0개', style: TextStyle(fontSize: size.width >= 800 ? 20 : 18, fontFamily: 'Pretendard', fontWeight: FontWeight.w800));
//                                 },
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           TextButton(
//             child: Text("결제하기", style: TextStyle(color : Colours.black, fontSize: size.width >= 800 ? 20 : 18, fontFamily: 'Pretendard', fontWeight: FontWeight.w800)),
//             onPressed: (){},
//             style: ButtonStyle(
//               padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 40, vertical: 30)),
//               overlayColor: MaterialStateProperty.all(Colours.blue)
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
