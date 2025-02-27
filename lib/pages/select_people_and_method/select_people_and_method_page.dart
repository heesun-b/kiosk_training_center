import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/widgets/counter_people.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/widgets/select_method.dart';
import 'package:provider/provider.dart';

class SelectPeopleAndMethodPage extends StatefulWidget {
  const SelectPeopleAndMethodPage({super.key});

  @override
  State<SelectPeopleAndMethodPage> createState() => _SelectPeopleAndMethodPageState();
}

class _SelectPeopleAndMethodPageState extends State<SelectPeopleAndMethodPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BasePage(
      audioPath: 'assets/audios/second.mp3',
      widget: Padding(
        padding: EdgeInsets.only(right: size.width * 0.1, left:  size.width * 0.2, bottom: size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("키오스크 트레이닝 센터 KIOSK TRAINING CENTER", style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontWeight: FontWeight.normal, fontSize: size.width * 0.04),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1, top: size.height * 0.1 ),
              child: const Column(
                children: [
                  CountPeople(),
                  SizedBox(height: 50),
                  SelectMethod(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

