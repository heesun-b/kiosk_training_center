import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class LoadingPopUp extends StatelessWidget {
  const LoadingPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
        children: [
            Image.asset('assets/images/loading.png', width: double.infinity,fit: BoxFit.fill),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                    width: 180,
                    height: 65,
                    alignment: Alignment.center,
                    child: Text("Hall 1",style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: size.width * 0.02, fontWeight: FontWeight.w800, color: Colours.black, decoration: TextDecoration.none)))),
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.02,
              child: SizedBox(
                width: size.width * 0.1,
                height: size.height * 0.065,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                    onPressed: () => context.pop(),
                    color: Colours.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, size: size.width * 0.025,),
                        Text("닫기", style: TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, fontSize: size.width * 0.02),),
                      ],
                    ),),
              ),
            )
        ]
      );
  }
}
