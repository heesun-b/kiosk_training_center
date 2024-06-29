// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kiosk_training_center/constants/colours.dart';
// import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider_v1.dart';
// import 'package:kiosk_training_center/pages/select_people_and_method/widgets/counter_people.dart';
// import 'package:kiosk_training_center/pages/select_people_and_method/widgets/select_method.dart';
// import 'package:provider/provider.dart';
//
// class SelectPeopleAndMethodPage extends StatefulWidget {
//   const SelectPeopleAndMethodPage({super.key});
//
//   @override
//   State<SelectPeopleAndMethodPage> createState() => _SelectPeopleAndMethodPageState();
// }
//
// class _SelectPeopleAndMethodPageState extends State<SelectPeopleAndMethodPage> {
//
//   final provider = SelectPeopleAndMethodProvider();
//
//   @override
//   void initState() {
//     super.initState();
//     provider.init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//         value: provider,
//         builder: (context, child) => _buildPage(context));
//   }
//
//   Widget _buildPage(BuildContext context) {
//
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: Colours.green,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colours.beige,
//                   borderRadius:  BorderRadius.circular(10),
//                 ),
//                 width: size.width * 0.8,
//                 height: size.height * 0.7,
//                 child:  const Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 50),
//                       child: Text("KIOSK TRAINING CENTER", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w800, fontSize: 50)),
//                     ),
//                     CountPeople(),
//                     SelectMethod(),
//                   ],
//                 ),
//               ),
//           ),
//             Consumer<SelectPeopleAndMethodProvider>(
//               builder: (context, provider, child) {
//               return Positioned(
//                       bottom: size.height * 0.1,
//                       left: size.width * 0.45,
//                       child: InkWell(
//                         onTap: provider.state.count > 0 && provider.state.selected ? () => GoRouter.of(context).goNamed("menu") : () {},
//                         child: Container(
//                           width: 100,
//                           height: 50,
//                           alignment: Alignment.center,
//                           // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colours.blue,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow:[
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: const Offset(3, 3), // changes position of shadow
//                               ),
//                             ],
//                             border: Border.all(
//                               color: Colours.black,
//                               width: 1,
//                             ),
//                           ),
//                           child: const Text('다음으로',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
//                         ),
//                       ),
//                     );
//               },
// )
//           ]
//         ),
//       ),
//     );
//   }
// }