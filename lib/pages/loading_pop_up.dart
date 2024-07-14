import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/PrintSDKUtil.dart';
import 'package:kiosk_training_center/common_widgets/my_button.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/main.dart';

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
                    child: Text("Hall",style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: size.width * 0.02, fontWeight: FontWeight.w800, color: Colours.black, decoration: TextDecoration.none)))),
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
                    onPressed: () => GoRouter.of(context).goNamed("start"),
                    color: Colours.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, size: size.width * 0.025,),
                        Text("닫기", style: TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, fontSize: size.width * 0.02),),
                      ],
                    ),),
              ),
            ),

          // Align(
          //   alignment: Alignment.center,
          //   child: Column(
          //     children: [
          //       MyButton(onTap: (){
          //         PrintSDKUtil.openPrint.call();
          //       }, title: "연결", width: 200, height: 100, fontSize: 15),
          //       MyButton(onTap: (){
          //         PrintSDKUtil.printExport.call();
          //       }, title: "인쇄", width: 200, height: 100, fontSize: 15),
          //       MyButton(onTap:() {
          //         PrintSDKUtil.cutPaper.call();
          //       }, title: "컷", width: 200, height: 100, fontSize: 15),
          //       MyButton(onTap:() {
          //         PrintSDKUtil.printClose.call();
          //       }, title: "종료", width: 200, height: 100, fontSize: 15),
          //       MyButton(onTap:() {
          //         PrintSDKUtil.initializePrinter.call();
          //       }, title: "초기화", width: 200, height: 100, fontSize: 15),
          //     ],
          //   ),
          // )
        ]
      );
  }
}
