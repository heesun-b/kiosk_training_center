import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class ProjectInfoPage extends StatelessWidget {
  const ProjectInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.03),
      child: Column(
        children: [
          const SizedBox(height: 35),
          Text("키오스크 트레이닝 센터 KIOSK TRAINING CENTER",
           style: TextStyle(fontSize: size.width * 0.025, fontFamily: MyTextStyle.ownglyphJooreeletter, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          const SizedBox(height: 25),
          FutureBuilder(
                future: provider.loadAsset('assets/textfiles/project_info.txt'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width:  size.width * 0.7,
                      child: Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontFamily: MyTextStyle.uhBeeMysen,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
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
              )

        ],
      ),
    );
  }
}
