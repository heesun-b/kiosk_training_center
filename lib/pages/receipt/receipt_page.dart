import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/date_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/signature_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/title_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/work_info_area.dart';

Widget receiptPage(List<Cart> cartList, ui.Image image) {

  return Container(
    color: Colours.white,
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        TitleArea(),
        DateArea(),

        Column(
          children: List.generate(cartList.length, (index) {
             return Column(
               children: [
                 WorkInfoArea(cart: cartList[index]),
                 SignatureArea(cart: cartList[index], image: image),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: CustomPaint(
                     painter: ReceiptDashedLinePainter(),
                     child: const SizedBox(
                       width: double.infinity,
                     ),
                   ),
                 ),
               ],
             );
        },),),

        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
          child: const Text(
            "www.over-man.com\n@space_ubermensch",
            style: TextStyle(fontFamily: MyTextStyle.pretendard, fontSize: 11),
          ),
        )

      ],
    ),
  );
}

class ReceiptDashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colours.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 8.0;
    var dashSpace = 3.0;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;  // ScrollBar를 숨기기 위해 child를 그대로 반환
  }
}

