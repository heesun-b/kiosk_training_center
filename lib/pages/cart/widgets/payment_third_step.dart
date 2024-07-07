import 'package:flutter/material.dart';
import 'package:kiosk_training_center/common_widgets/my_button.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class PaymentThirdStep extends StatefulWidget {
  const PaymentThirdStep({super.key});

  @override
  State<PaymentThirdStep> createState() => _PaymentThirdStepState();
}

class _PaymentThirdStepState extends State<PaymentThirdStep> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  Future<void> _handleSaveButtonPressed() async {
    // var provider =  context.watch<MenuProvider>();
    // final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    // final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    // provider.saveSign(bytes!.buffer.asUint8List());

    Provider.of<MenuProvider>(context, listen: false).nextPaymentStep();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03, top: size.height * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("서명을 해 주세요", style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.035, color: Colours.darkGrey, letterSpacing: 3, decoration: TextDecoration.none)),
          Container(
              height: size.height * 0.6,
              padding: EdgeInsets.only(left: size.width * 0.02, right:size.width * 0.02, bottom: size.height * 0.1),
              margin: EdgeInsets.symmetric(horizontal:size.width * 0.04),
              color: Colours.white,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colours.black, width: 2)
                  )
                ),
                child: SfSignaturePad(
                    key: signatureGlobalKey,
                    backgroundColor: Colors.white,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 4.0,
                    maximumStrokeWidth: 4.0),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(onTap: _handleSaveButtonPressed, title: "서명완료", width: size.width * 0.1, height: size.height * 0.08, fontSize: size.width * 0.02, radius: 50, fontFamily: MyTextStyle.dungGeunMo),
                MyButton(onTap: _handleClearButtonPressed, title: "다시하기", width: size.width * 0.1, height: size.height * 0.08, fontSize: size.width * 0.02, radius: 50, fontFamily: MyTextStyle.dungGeunMo),
          ])
        ],
      ),
    );
  }
}

