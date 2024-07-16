import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/receipt/receipt_page.dart';

class DateArea extends StatelessWidget {
  const DateArea({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            nowDate(),
            style: const TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomPaint(
            painter: ReceiptDashedLinePainter(),
            child: const SizedBox(
              width: 300,
            ),
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