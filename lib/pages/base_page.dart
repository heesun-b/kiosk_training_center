import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';

class BasePage extends StatelessWidget {
  final Widget widget;

  const BasePage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.background,
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colours.red,
                                      width: 5
                                  )
                              )
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Row(
                                children: [
                                  Text("2024", style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontSize: size.width * 0.035)),
                                  SizedBox(width: size.width * 0.06),
                                  Text("키오스크 트레이닝 센터 KIOSK TRAINING CENTER", style: TextStyle(fontFamily: MyTextStyle.ownglyphJooreeletter, fontSize: size.width * 0.035), textAlign: TextAlign.start,),
                                ],
                              ),
                            ),
                            Container(
                                height: size.height * 0.1,
                                width: 100,
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: Colours.red,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
                                ),
                                child: Text("HALL 1", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize:  size.width * 0.015, fontWeight: FontWeight.w800), textAlign: TextAlign.center,)
                            ),
                          ],
                        )
                      ]
                  ),

                  Expanded(
                    child: CustomPaint(
                      painter: LinePainter(),
                      child: SizedBox(
                        width: double.infinity,
                        child: widget,
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: size.width * 0.15,
                child: Container(
                  width: 10,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colours.red, width: 2),
                      right: BorderSide(color: Colours.red, width: 2),
                    )
                  ),
                )
              ),
            ],
          )),
    );
  }
}


class LinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colours.blue
      ..strokeWidth = 0.8;

    Paint paint2 = Paint()
      ..color = Colours.red
      ..strokeWidth = 0.8;

    for (double y = 0; y < size.height; y += 20) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // canvas.drawLine(Offset(0, y), Offset(size.width, y), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
