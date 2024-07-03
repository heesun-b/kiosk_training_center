import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/video/video_provider.dart';
import 'package:kiosk_training_center/pages/video/widgets/video_button.dart';
import 'package:provider/provider.dart';

class StopScreen extends StatelessWidget {
  const StopScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    var provider =  context.watch<VideoProvider>();
    var size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () =>  provider.clickedScreen(),
        child: AnimatedOpacity(
          opacity: provider.state.clickedScreen ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.7,
                colors: [Colours.white.withOpacity(0.8), Colours.black.withOpacity(0.8)],
                stops: [0.0, 2.0],
              ),
            ),
            child: !provider.state.clickedIconButton ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.state.cartList[provider.state.currentIndex].authorName, style: TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, color: Colours.black ,fontSize: size.width * 0.03, decoration: TextDecoration.none, backgroundColor: Colours.white.withOpacity(0.5)),),
                const SizedBox(height: 20),
                Text(provider.state.cartList[provider.state.currentIndex].workName, style: TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, color: Colours.black ,fontSize: size.width * 0.03, decoration: TextDecoration.none, backgroundColor: Colours.white.withOpacity(0.5))),
              ],
            ) :
                provider.state.currentIndex < provider.state.cartList.length - 1 ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VideoButton(title: "이어보기",showIcon: true,onPressed: () => provider.continueVideo(),),
                VideoButton(title: "다음 영상 보기",onPressed: () => provider.nextVideo()),
              ],
            )
            : Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.3, vertical: size.height * 0.4),
              child: VideoButton(title: "영상 종료 하기",onPressed: () => provider.endVideo(context)),
            ),
          ),
        ),
      );
  }
}
