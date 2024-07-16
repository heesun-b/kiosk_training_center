import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/date_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/signature_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/title_area.dart';
import 'package:kiosk_training_center/pages/receipt/widgets/work_info_area.dart';
import 'package:provider/provider.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  ui.Image? image;
  // List<Cart> cartList = [];
  List<Cart> cartList = [
    Cart(
        authorName: '전보경',
        workName: 'Zeros: 오류의 동작',
        caption: '2020, 2채널 비디오의 단채널 버전, 컬러, 사운드, 13분 20초',
        workImage: 'assets/images/works/zeros_operation_errors.jpg',
        workVideo: '',
        price: 3)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      image = Provider.of<MenuProvider>(context, listen: false).state.signImage;
      // cartList = Provider.of<MenuProvider>(context, listen: false).state.cartList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.white,
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleArea(),
              DateArea(),
              WorkInfoArea(cart: cartList[0]),
              SignatureArea(cart: cartList[0], image: image),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1, bottom: size.height * 0.1, right: size.width * 0.02, left: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "@space_ubermensch\nwww.over-man.com",
                      style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.03),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/images/qr.jpg', height: size.height * 0.3)),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class ReceiptDashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colours.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 15.0;
    var dashSpace = 10.0;
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

