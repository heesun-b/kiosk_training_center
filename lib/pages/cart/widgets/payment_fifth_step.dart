import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class PaymentFifthStep extends StatefulWidget {
  const PaymentFifthStep({super.key});

  @override
  State<PaymentFifthStep> createState() => _PaymentFifthStepState();
}

class _PaymentFifthStepState extends State<PaymentFifthStep> {

  Timer? timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer(const Duration(seconds: 3), () {
        GoRouter.of(context).pushNamed("count_down", extra: Provider.of<MenuProvider>(context, listen: false).state.cartList,);
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
