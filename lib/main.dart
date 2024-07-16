import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/routers.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/video/video_provider.dart';
import 'package:kiosk_training_center/sle_memory_card.dart';
import 'package:provider/provider.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

void main() async {

  init();
  // var connect = sleMemoryCard.connect("ACS ACR39U ICC Reader 0", "");
  // print(connect);
  VideoPlayerMediaKit.ensureInitialized(
    android: true,          // default: false    -    dependency: media_kit_libs_android_video
    iOS: true,              // default: false    -    dependency: media_kit_libs_ios_video
    macOS: true,            // default: false    -    dependency: media_kit_libs_macos_video
    windows: true,          // default: false    -    dependency: media_kit_libs_windows_video
    linux: true,            // default: false    -    dependency: media_kit_libs_linux
  );

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
