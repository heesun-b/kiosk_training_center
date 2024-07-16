import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/menu/usage_info/widgets/usage_info_content.dart';
import 'package:provider/provider.dart';

class UsageInfoPage extends StatelessWidget {
  const UsageInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.08),
          Text('아래의 내용을 확인 후 관람을 진행해 주세요.',
            style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontSize: size.width * 0.02, fontWeight: FontWeight.bold),),
          SizedBox(height: size.height * 0.05),
          UsageInfoContent(title: "전용 카드 사용", imagePath: "assets/images/help_1.png", textPath: 'assets/textfiles/help_card_info.txt'),
          SizedBox(height: size.height * 0.1),
          UsageInfoContent(title: "영 수 증", imagePath: "assets/images/help_2.png", textPath: 'assets/textfiles/help_reciept_info.txt'),
          SizedBox(height: size.height * 0.1),
          UsageInfoContent(title: "돋보기 안경", imagePath: "assets/images/help_3.png", textPath: 'assets/textfiles/help_magnifier_info.txt'),
          SizedBox(height: size.height * 0.1),
          UsageInfoContent(title: "소리 크기 및 헤드폰 사용", imagePath: "assets/images/help_4.png", textPath: 'assets/textfiles/help_sound_info.txt'),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }
}
