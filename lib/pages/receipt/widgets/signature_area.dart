import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/receipt/receipt_page.dart';


class SignatureArea extends StatelessWidget {
  final ui.Image? image;
  final Cart cart;

  const SignatureArea({super.key, this.image, required this.cart});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.15, vertical: size.height * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                  child: Image.asset(signaturePath(cart.authorName))),
              image != null ?
              CustomPaint(painter: ImagePainter(image!), size: Size(size.width * 0.3, size.height * 0.3),)
                  : Container(color: Colours.pink1, width: size.width * 0.3, height: size.height * 0.3,)

            ],
          ),
        ),
        CustomPaint(
          painter: ReceiptDashedLinePainter(),
          child: SizedBox(
            width: size.width * 0.9,
          ),
        ),
      ],
    );
  }
}

String signaturePath(String authName) {
  if(authName == '전보경') {
    return 'assets/images/signature/signature_jbk.jpg';
  } else if(authName == '최지목') {
    return 'assets/images/signature/signature_cjm.jpg';
  } else {
    return 'assets/images/signature/signature_hs.jpg';
  }
}

class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    paintImage(
      canvas: canvas,
      image: image,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
