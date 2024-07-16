import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final String fontFamily;
  final double radius;
  final bool check;
  final FontWeight fontWeight;

  const MyButton({
    super.key,
    this.radius = 10.0,
    this.check = false,
    this.fontFamily = MyTextStyle.computersetak,
    required this.onTap,
    required this.title,
    required this.width,
    required this.height,
    required this.fontSize,
    this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: check ? Colours.pink1 : Colours.white,
            border: Border.all(color: Colours.pink1, width: 2),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                  color: Colours.grey2,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 3.0,
                  spreadRadius: 1.0
              )
            ]
        ),
        child: Text(title, style: TextStyle(fontWeight: fontWeight,color: Colours.black, fontFamily: fontFamily, fontSize: fontSize, decoration: TextDecoration.none),textAlign: TextAlign.center,),
      ),
    );
  }
}
