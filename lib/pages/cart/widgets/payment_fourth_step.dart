import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class PaymentFourthStep extends StatefulWidget {
  const PaymentFourthStep({super.key});

  @override
  State<PaymentFourthStep> createState() => _PaymentFourthStepState();
}

class _PaymentFourthStepState extends State<PaymentFourthStep> {
  int _currentCircle = 0;

  Timer? timer;
  Timer? timer2;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _currentCircle = (_currentCircle + 1) % 4;
        });
      });

      timer2 = Timer(const Duration(seconds: 3), () {
        Provider.of<MenuProvider>(context, listen: false).nextPaymentStep();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer2?.cancel();
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
