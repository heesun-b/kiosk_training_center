import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routers().routers,
      title: 'KIOSK TRAINING CENTER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colours.main),
        useMaterial3: true,
        fontFamily: 'Pretendard',
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
    );
  }
}
