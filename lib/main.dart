import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/routers.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/video/video_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>(
          create: (context) => MenuProvider(),
        ),
        ChangeNotifierProvider<SelectPeopleAndMethodProvider>(
          create: (context) => SelectPeopleAndMethodProvider(),
        ),
        ChangeNotifierProvider<VideoProvider>(
          create: (context) => VideoProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: Routers().routers,
        title: 'KIOSK TRAINING CENTER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colours.main),
          useMaterial3: true,
          scrollbarTheme: ScrollbarThemeData(
            // thumbColor: MaterialStateProperty.all(Colours.red), // Scrollbar의 썸(Thumb) 색상 설정
            thumbColor: MaterialStateProperty.all(Colours.blueGrey), // Scrollbar의 썸(Thumb) 색상 설정
            crossAxisMargin: 0,
            thickness: MaterialStateProperty.all(15.0),
            radius: const Radius.circular(10),
            trackBorderColor: MaterialStateProperty.all(Colours.green2),
            thumbVisibility: MaterialStateProperty.all(true),
            trackVisibility: MaterialStateProperty.all(true),
            minThumbLength: 30.0
          )
        ),
      ),
    );
  }
}
