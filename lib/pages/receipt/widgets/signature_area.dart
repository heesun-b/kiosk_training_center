import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/receipt/receipt_page.dart';


class SignatureArea extends StatelessWidget {
  final ui.Image image;
  final Cart cart;

  const SignatureArea({super.key, required this.image, required this.cart});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  height: 50,
                  child: Image.asset(signaturePath(cart.authorName))),
              CustomPaint(painter: ImagePainter(image!), size: Size(100, 50),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomPaint(
            painter: ReceiptDashedLinePainter(),
            child: const SizedBox(
              width: double.infinity,
            ),
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
