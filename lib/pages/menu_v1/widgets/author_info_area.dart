// import 'package:flutter/material.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:provider/provider.dart';
//
// class AuthorInfoArea extends StatelessWidget {
//   final String name;
//   final String imagePath;
//   final String infoPath;
//
//   const AuthorInfoArea({super.key, required this.name, required this.imagePath, required this.infoPath});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 40),
//         Text("$name 작가 설명", style: const TextStyle(fontFamily: 'Pretendard', fontSize: 18, fontWeight: FontWeight.w800)),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                   height: size.height * 0.35,
//                   width:  size.width * 0.35,
//                   child: Image.asset(imagePath, filterQuality: FilterQuality.high, fit: BoxFit.cover,)),
//               const SizedBox(width: 20),
//               Consumer<MenuProvider>(
//                 builder: (context, provider, child) {
//                 return FutureBuilder(
//                           future: provider.loadAsset(infoPath),
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               return SizedBox(
//                                   width: size.width > 800 ? size.width * 0.40 :  size.width * 0.35,
//                                   // height: size.height * 0.35,
//                                   child: Text(
//                                       snapshot.data.toString(),
//                                       style: const TextStyle(
//                                           fontFamily: 'Pretendard',
//                                           fontWeight: FontWeight.w500,
//                                           letterSpacing: 1.0
//                                       ),
//                                       overflow: TextOverflow.visible,
//                                       textAlign: TextAlign.justify));
//                             } else {
//                               return const CircularProgressIndicator(); // 데이터 로딩 중이라면 로딩 인디케이터 표시
//                             }
//                           },
//                         );
//                   },
//                 )
//             ],
//           ),
//         ),
//       ]);
//   }
// }
