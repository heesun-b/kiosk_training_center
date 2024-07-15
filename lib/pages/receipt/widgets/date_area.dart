import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/receipt/receipt_page.dart';

class DateArea extends StatelessWidget {
  const DateArea({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
          child: Text(
            nowDate(),
            style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.03),
          ),
        ),
        CustomPaint(
          painter: ReceiptDashedLinePainter(),
          child: SizedBox(
            width: size.width * 0.9,
          ),
        ),
      ],
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