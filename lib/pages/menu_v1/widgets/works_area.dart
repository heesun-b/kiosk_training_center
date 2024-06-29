// import 'package:flutter/material.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/dto/work.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:provider/provider.dart';
//
// class WorksArea extends StatelessWidget {
//   final String name;
//   final List<Work> works;
//
//   const WorksArea({super.key, required this.name, required this.works});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("$name 작가 작품", style: const TextStyle(fontFamily: 'Pretendard', fontSize: 18, fontWeight: FontWeight.w800)),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: List.generate(works.length,
//                   (index) =>  Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     padding: const EdgeInsets.all(40),
//                     width: size.width * 0.7,
//                     decoration: BoxDecoration(
//                       color: Colours.white,
//                       border: Border.all(
//                         color: Colours.black,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(
//                                 width: size.width * 0.30,
//                                 height: size.height * 0.30,
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset(works[index].imagePath, fit: BoxFit.cover))),
//                             const SizedBox(width: 30,),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(works[index].krName, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 15, fontWeight: FontWeight.w800)),
//                                   Text('(${works[index].enName})', style: const TextStyle(fontFamily: 'Pretendard', fontSize: 15, fontWeight: FontWeight.w500)),
//                                   const SizedBox(height: 10),
//                                   Text(works[index].caption, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 11, fontWeight: FontWeight.w500)),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         if(works[index].infoPath != null)
//                           Consumer<MenuProvider>(
//                             builder: (context, provider, child) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(top: 20.0),
//                                 child: FutureBuilder(
//                                   future: provider.loadAsset(works[index].infoPath!),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return SizedBox(
//                                           width: size.width * 0.65,
//                                           // height: size.height * 0.35,
//                                           child: Text(
//                                               snapshot.data.toString(),
//                                               style: const TextStyle(
//                                                   fontFamily: 'Pretendard',
//                                                   fontWeight: FontWeight.w500,
//                                                   letterSpacing: 1.0
//                                               ),
//                                               overflow: TextOverflow.visible,
//                                               textAlign: TextAlign.justify));
//                                     } else {
//                                       return const CircularProgressIndicator(); // 데이터 로딩 중이라면 로딩 인디케이터 표시
//                                     }
//                                   },
//                                 ),
//                               );
//                             },
//                           )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//           ),
//         )
//       ],
//     );
//   }
// }
