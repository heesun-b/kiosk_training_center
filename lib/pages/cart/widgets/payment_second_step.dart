import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/sle_memory_card.dart';
import 'package:provider/provider.dart';

class PaymentSecondStep extends StatefulWidget {

  const PaymentSecondStep({super.key});

  @override
  State<PaymentSecondStep> createState() => _PaymentSecondStepState();
}

class _PaymentSecondStepState extends State<PaymentSecondStep>{

  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer(const Duration(seconds: 100), () {
        // 1초 마다 실행
        Timer.periodic(const Duration(seconds: 1), (timer) {
          timer.cancel();
          if (init()) {
            this.timer?.cancel();
            Provider.of<MenuProvider>(context, listen: false).nextPaymentStep();
          }
        });
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(child: Text("카드를\n넣어\n주세요", style: TextStyle(color: Colours.darkGrey, fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.04, decoration: TextDecoration.none, height: 1.5), softWrap: true,)),
              Transform.rotate(
                  angle: 180 * (3.1415927 / 180),
                  child: Image.asset('assets/images/arrow.gif', width: size.width * 0.18, fit: BoxFit.fill,))
            ],
          ),
          Container(
            width: size.width * 0.17,
            height: size.height * 0.45,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding:  const EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colours.green4,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("키오스크 트레이닝 센터\n전용 카드 사용", style: TextStyle(color: Colours.red, fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.012, decoration: TextDecoration.none, letterSpacing: 2, wordSpacing: 2, height: 1.5),textAlign: TextAlign.center),
          )
        ],),
    );
  }
}
