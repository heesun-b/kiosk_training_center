import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:lottie/lottie.dart';

class PaymentFourthStep extends StatefulWidget {
  const PaymentFourthStep({super.key});

  @override
  State<PaymentFourthStep> createState() => _PaymentFourthStepState();
}

class _PaymentFourthStepState extends State<PaymentFourthStep> {
  int _currentCircle = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      setState(() {
        _currentCircle = (_currentCircle + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
      child: Column(
        children: [
          Text("결제 중 입니다", style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.035, color: Colours.darkGrey, letterSpacing: 3, decoration: TextDecoration.none)),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: _currentCircle == index ? 70.0 : 60.0,
                  height: _currentCircle == index ? 70.0 : 60.0,
                  margin: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colours.blue2,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
