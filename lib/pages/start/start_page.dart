import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kiosk_training_center/common_widgets/my_appbar.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/start/widgets/title_container.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.main,
      appBar: MyAppbar(

      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(child: TitleContainer(text: "KIOSK",)),
              const FittedBox(child: TitleContainer(text: "TRAINING CENTER"),
              ),
              Text("키오스크 트레이닝 센터", style: TextStyle(color: Colours.sky, fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width >= CriteriaSize.widthSize1 ? 65 : size.width >= CriteriaSize.widthSize2 ? 55 : 45)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // stopAudio();
                  GoRouter.of(context).goNamed("select_people_and_method");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colours.main,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colours.pinkGrey,
                        offset: Offset(-1, 5)
                      )
                    ]
                  ),
                  child: Text("입장하기", style: TextStyle(color: Colours.brown, fontFamily: MyTextStyle.computersetak, fontWeight: FontWeight.w800, fontSize: size.width >= CriteriaSize.widthSize1 ? 20 : size.width >= CriteriaSize.widthSize2 ? 18 : 15),textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
