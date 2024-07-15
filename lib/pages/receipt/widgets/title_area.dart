import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class TitleArea extends StatelessWidget {
  const TitleArea({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Container(
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
    );
  }
}
