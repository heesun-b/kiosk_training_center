import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:provider/provider.dart';


class CountPeople extends StatelessWidget {
   const CountPeople({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var provider =  context.watch<SelectPeopleAndMethodProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("참여 인원 선택", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontWeight: FontWeight.w500, fontSize: size.width >= CriteriaSize.widthSize2 ? 30 : 25)),
        Row(
          children: [
            // GestureDetector(
            //     onTap: () => provider.minus(),
            //     child: Image.asset('assets/images/icons/minus_icon.png', width: 20)),
            GestureDetector(
                onTap: () => provider.minus(),
                child: const FaIcon(FontAwesomeIcons.minus, shadows: [Shadow(color: Colours.darkGrey, offset: Offset(0.0, 3.0), blurRadius: 3)],)),

            // Container(
            //   width: 40,
            //   height: 40,
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //     color: Colours.white,
            //     borderRadius: BorderRadius.circular(5),
            //     boxShadow:[
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.8),
            //         spreadRadius: 1,
            //         blurRadius: 3,
            //         offset: const Offset(0, 3), // changes position of shadow
            //       ),
            //     ],
            //     border: Border.all(
            //       color: Colours.pink1,
            //       width: 1,
            //     ),
            //   ),
            //   child: Text(provider.state.count.toString(),style: const TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, fontSize: 20, fontWeight: FontWeight.bold)),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                  provider.state.count.toString(),
                  style: const TextStyle(
                      fontFamily: MyTextStyle.kimjungchulGothic,
                      fontSize: 25, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0.0, 3.0),
                          blurRadius: 2.0,
                          color: Colours.grey
                        ),
                      ],)),
            ),
            // GestureDetector(
            //     onTap: () => provider.add(),
            //     child: Image.asset('assets/images/icons/add_icon.png', width: 20,)),
            GestureDetector(
                onTap: () => provider.add(),
                child: const FaIcon(FontAwesomeIcons.plus, shadows: [Shadow(color: Colours.darkGrey, offset: Offset(0.0, 3.0), blurRadius: 3)],)),
            const SizedBox(width: 25,)
          ],
        )

      ],
    );
  }
}


