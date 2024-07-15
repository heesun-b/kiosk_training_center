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
          padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
          child: SizedBox(
              width: size.width * 0.7,
              height: size.height * 0.7,
              child: ColorFiltered(
                  colorFilter:  const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(cart.workImage, fit: BoxFit.fill))),
        ),
        Text("${cart.authorName}, <${cart.workName}>",
          style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.03),),
        SizedBox(height: size.height * 0.08),
        Text(cart.caption,
          style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.02),),
      ],
    );
  }
}
