import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/routers.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/video/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'dart:ffi'; // For FFIimport 'dart:io';
import 'package:ffi/ffi.dart';

typedef PrinterOpenFunc = Int64 Function(Int32, Pointer<Utf8>, Int32, Int32, Int32, Int32, Int32);
typedef PrinterOpen = int Function(int, Pointer<Utf8>, int, int, int, int, int);

void main() {

  final DynamicLibrary func = DynamicLibrary.open('assets/lib/BXLPAPI.dll');
  final printerOpen = func.lookupFunction<PrinterOpenFunc, PrinterOpen>('PrinterOpen');

  // Example call with parameters similar to your C++ example
  String printerName = ''; // Replace with your printer
  int lResult = printerOpen(2, printerName.toNativeUtf8(), 0, 0, 0, 0, 0);

  print('PrinterOpen result: $lResult');

  // Free memory allocated by Utf8.toUtf8
  // printerNamePtr.free();

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
