import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.watch<MenuProvider>();

    return Scaffold(
      backgroundColor: Colours.white,
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Container(
                 margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                 padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: size.height * 0.015),
                 width: double.infinity,
                 height: size.height * 0.4,
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colours.black,
                     width: 3
                   ),
                 ),
                 child: Container(
                   width: double.infinity,
                   height: size.height * 0.4,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colours.black,
                         width: 2
                     ),
                   ),
                   alignment: Alignment.center,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         "Kiosk Training Center",
                         style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.05),
                       ),
                       Text(
                         "키오스크 트레이닝 센터",
                         style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.05),
                       ),
                     ],
                   ),
                 ),
               ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                child: Text(
                  nowDate(),
                  style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.03),
                ),
              ),
              CustomPaint(
                painter: DashedLinePainter(),
                child: SizedBox(
                  width: size.width * 0.9,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
                child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.7,
                    child: ColorFiltered(
                        colorFilter:  const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        ),
                        child: Image.asset("assets/images/works/zeros_operation_errors.png", fit: BoxFit.fill))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String nowDate() {
  var dateTime = DateTime.now();
  const weekDays = ['월', '화', '수', '목', '금', '토', '일'];
  String weekDay = weekDays[dateTime.weekday - 1];

  String period = dateTime.hour < 12 ? '오전' : '오후';
  int hour = dateTime.hour % 12;
  if (hour == 0) hour = 12;
  String minute = dateTime.minute.toString().padLeft(2, '0');

  return '${dateTime.year}. ${dateTime.month}. ${dateTime.day} ($weekDay) $period $hour시 $minute분';
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colours.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 15.0;
    var dashSpace = 10.0;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;  // ScrollBar를 숨기기 위해 child를 그대로 반환
  }
}