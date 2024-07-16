import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class UsageInfoContent extends StatelessWidget {
  final String title;
  final String imagePath;
  final String textPath;

  const UsageInfoContent({super.key, required this.title, required this.imagePath, required this.textPath});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/star.png', width: size.width * 0.06),
                  Text(title,
                    style: TextStyle(fontFamily: MyTextStyle.uhBeeMysen, fontWeight: FontWeight.bold, fontSize: size.width * 0.05, height: 0.8)),
                  Image.asset('assets/images/star.png', width: size.width * 0.06),
                ],
              ),
            ),
            titleWidget(title, size)
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Image.asset(imagePath, width: size.width * 0.25,),
        SizedBox(height: size.height * 0.07),
        FutureBuilder(
          future: provider.loadAsset(textPath),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width:  size.width * 0.5,
                child: Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontFamily: MyTextStyle.uhBeeMysen,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        height: 1.0
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.justify),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(top:  size.height * 0.3),
                child: const CircularProgressIndicator(),
              ); // 데이터 로딩 중이라면 로딩 인디케이터 표시
            }
          },
        ),
      ],
    );
  }


}

Widget titleWidget(String title, Size size) {

  if(title == '전용 카드 사용') {
    return Positioned(
        left: size.width * 0.31,
        top: size.height * 0.076,
        child: Image.asset('assets/images/line.png', width: size.width * 0.2));
  } else if (title == '영 수 증') {
    return Positioned(
        left: size.width * 0.35,
        top: size.height * 0.09,
        child: Image.asset('assets/images/line_2.png', width: size.width * 0.11));
  } else if(title == '돋보기 안경') {
    return Positioned(
        left: size.width * 0.33,
        top: size.height * 0.09,
        child: Image.asset('assets/images/line_3.png', width: size.width * 0.15));
  }

  return Positioned(
      left: size.width * 0.23,
      top: size.height * 0.09,
      child: Image.asset('assets/images/line_4.png', width: size.width * 0.35));

}