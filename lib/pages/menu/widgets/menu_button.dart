import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class MenuButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool selected;
  final String? count;
  final double verticalPadding;

  const MenuButton({super.key, required this.onTap, required this.text, required this.selected, this.count, this.verticalPadding = 10.0});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      hoverDuration: const Duration(milliseconds: 300),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if(selected)
            Image.asset('assets/images/mark.png', width: size.width * 0.085),
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -20),
              badgeContent: count != null ? Center(child: Text(count!, style: TextStyle(color: Colours.white),)) : null,
              showBadge:  count != null ? true : false,
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colours.red,
                borderRadius: BorderRadius.circular(4),
              ),
              badgeAnimation: const badges.BadgeAnimation.scale (
                animationDuration: Duration(milliseconds: 100),
                colorChangeAnimationDuration: Duration(milliseconds: 100),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              child: SizedBox(
                width: size.width * 0.075,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    changeText(text: text.length < 4 ? text.substring(0,text.length) : text.substring(0,4), size: size.width),
                    if(text.length > 4)
                      changeText(text: text.substring(4), size: size.width),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeText({required String text, required double size}) {
    List<String> characters = text.split('');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          characters.length,
          (index) => Text(
              characters[index],
              style: TextStyle(
                fontFamily: MyTextStyle.ownglyphJooreeletter,
                color: Colours.black,
                fontSize: size * 0.025,
                fontWeight: FontWeight.normal,
                height: 0.8
              ),
          ))
    );
  }
}
