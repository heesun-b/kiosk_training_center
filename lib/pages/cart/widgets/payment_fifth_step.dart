import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class PaymentFifthStep extends StatelessWidget {
  const PaymentFifthStep({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Center(
        child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colours.darkGrey, width: 2)
              )
            ),
            child: Text("결제가 완료\n되었습니다.", style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.04,fontWeight: FontWeight.normal , color: Colours.darkGrey, letterSpacing: 3, decoration: TextDecoration.none, height: 1.5))));
  }
}
