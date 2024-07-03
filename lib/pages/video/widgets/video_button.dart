import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class VideoButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool showIcon;

  const VideoButton({super.key, required this.title, required this.onPressed, this.showIcon = false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MaterialButton(
      onPressed: onPressed,
      color: Colours.white.withOpacity(0.7),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.05),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colours.pink1.withOpacity(0.7), width: 2)// 모서리 반경을 지정합니다.
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(showIcon)
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(CupertinoIcons.play, color: Colours.darkGrey, size: size.width * 0.04),
          ),
          Text(title, style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, color: Colours.darkGrey, fontSize: size.width * 0.04), textAlign: TextAlign.center,)
        ],
      ));
  }
}
