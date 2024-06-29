import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color color;

  const MyAppbar({super.key, this.title, this.color = Colours.main});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      title: title != null ? Text(title!, style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontSize: size.width >= 740 ? 25 : size.width >= 660 ? 22 : 18)) : null,
      actions: [
        Container(
          width: 100,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colours.red,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
          ),
          child: const Text("HALL 1", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: 15, fontWeight: FontWeight.w800), textAlign: TextAlign.center,),
        )
      ],
      shape: const Border(
        top: BorderSide(color: Colours.red, width: 5),
      ),
      toolbarHeight: 45.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
