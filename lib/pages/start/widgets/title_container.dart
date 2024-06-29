import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class TitleContainer extends StatelessWidget {
  final String text;

  const TitleContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top:size.width >= CriteriaSize.widthSize1  ? 62 : size.width >= CriteriaSize.widthSize2 ? 60 : 43,
          left: 0,
          right: 0,
          child: Container(
            height: size.width >= CriteriaSize.widthSize1  ? 25 : size.width >= CriteriaSize.widthSize2 ? 20 : 20,
            decoration: BoxDecoration(
              color: Colours.pink1,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colours.pink4,
                  offset: Offset(0,  size.width >= CriteriaSize.widthSize2 ? -30 : -18)
                ),
                BoxShadow(
                    color: Colours.pink3,
                    offset: Offset(0,size.width >= CriteriaSize.widthSize2 ? -20 : -12)
                ),
                BoxShadow(
                    color: Colours.pink2,
                    offset: Offset(0, size.width >= CriteriaSize.widthSize2 ? - 10 : -6)
                )
              ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(text, style: TextStyle(height: 1.2, color: Colours.green,fontSize: size.width >= CriteriaSize.widthSize1 ? 95 : size.width >= CriteriaSize.widthSize2 ? 88 : 70, fontFamily: MyTextStyle.dungGeunMo), textAlign: TextAlign.start),
        )
     ]
    );
  }
}
