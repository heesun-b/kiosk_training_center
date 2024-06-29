// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/dto/work.dart';
// import 'package:kiosk_training_center/pages/menu/menu_provider_v1.dart';
// import 'package:kiosk_training_center/pages/menu/widgets/author_info_area.dart';
// import 'package:kiosk_training_center/pages/menu/widgets/works_area.dart';
// import 'package:provider/provider.dart';
//
// class ScrollablePage extends StatelessWidget {
//   final String name;
//   final ScrollController scrollController;
//   final String authorInfo;
//   final List<Work> works;
//
//   const ScrollablePage({super.key, required this.name, required this.scrollController,required this.authorInfo, required this.works});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ListView(
//       controller: scrollController,
//       children: [
//         AuthorInfoArea(
//           name: name,
//           imagePath: works[0].imagePath,
//           infoPath: authorInfo,
//         ),
//         const SizedBox(height: 30),
//
//         WorksArea(
//           name: name,
//           works: works,
//         ),
//
//         const SizedBox(height: 80),
//       ],
//     );
//   }
// }
//
