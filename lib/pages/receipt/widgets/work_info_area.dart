import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';

class WorkInfoArea extends StatelessWidget {
  final Cart cart;

  const WorkInfoArea({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 30),
          child: SizedBox(
              width: 200,
              height: 150,
              child: Image.asset(cart.workImage, fit: BoxFit.fill)),
        ),
        Text("${cart.authorName}, <${cart.workName}>",
          style: const TextStyle(fontFamily: MyTextStyle.pretendard, fontSize: 13, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(cart.caption,
            style: const TextStyle(fontFamily: MyTextStyle.pretendard, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
