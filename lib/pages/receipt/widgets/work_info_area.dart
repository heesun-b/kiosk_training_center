import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';

class WorkInfoArea extends StatelessWidget {
  final Cart cart;

  const WorkInfoArea({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 30),
          child: SizedBox(
              width: 200,
              height: 150,
              child: ColorFiltered(
                  colorFilter:  const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(cart.workImage, fit: BoxFit.fill))),
        ),
        Text("${cart.authorName}, <${cart.workName}>",
          style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: 10, fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Text(cart.caption,
          style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: 8, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
