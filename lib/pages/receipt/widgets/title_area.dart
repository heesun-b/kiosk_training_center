import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class TitleArea extends StatelessWidget {
  const TitleArea({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colours.black,
            width: 2
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colours.black,
              width: 1
          ),
        ),
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kiosk Training Center",
              style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(
              "키오스크 트레이닝 센터",
              style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
