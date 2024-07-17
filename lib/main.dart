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
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  // init();
  // var connect = sleMemoryCard.connect("ACS ACR39U ICC Reader 0", "");
  // print(connect);

  // Initialize window manager
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize(); // Maximize the window
    await windowManager.setFullScreen(true); // Set to fullscreen
  });


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
        scaffoldMessengerKey: scaffoldMessengerKey,
        restorationScopeId: "ktc",
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
