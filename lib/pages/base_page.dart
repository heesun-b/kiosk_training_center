import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  final Widget widget;
  final int? peopleCount;
  final String audioPath;
  final VoidCallback? floatingButtonOnTap;
  final bool forCart;

  BasePage({super.key, required this.widget, this.peopleCount, required this.audioPath, this.floatingButtonOnTap, this.forCart = false});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SelectPeopleAndMethodProvider>(context, listen: false).init();
    });
  }

  @override
  void dispose() {
    // Provider.of<SelectPeopleAndMethodProvider>(context, listen: false).baseDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider =  context.watch<SelectPeopleAndMethodProvider>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colours.background,
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  /// 페이지 상단, 앱 바 비슷한 역할
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if(widget.peopleCount != null)
                            Text('총 인원 ${widget.peopleCount}명 / ', style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: !widget.forCart ? 16 : 13)),
                            Text(nowDate(provider.state.currentTime), style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize:  !widget.forCart ? 16 : 13)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: MaterialButton(
                                  // TODO : 추가
                                  onPressed: () => provider.playAudio2(),
                                  color: Colours.blue,
                                  padding: EdgeInsets.zero,
                                  height: 30,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(child: Text("직원호출", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: !widget.forCart ? 14 : 12, height: 2.0))),),
                            ),
                            IconButton(
                                onPressed: () => provider.playAudio(widget.audioPath),
                                icon: Icon(provider.state.isPlayedAudio ? CupertinoIcons.speaker_slash  : CupertinoIcons.speaker_2, color: Colours.white, size: !widget.forCart ? 30 : 25,)),
                            Container(
                                height: size.height * 0.08,
                                width: 100,
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: Colours.red,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
                                ),
                                child: Text(!widget.forCart ? "HALL 1" : "장바구니", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontSize: size.width * 0.015, fontWeight: FontWeight.w800), textAlign: TextAlign.center,)
                            ),
                          ],
                        )
                      ]
                  ),

                  /// 각 페이지가 들어갈 부분
                  Expanded(
                    child: CustomPaint(
                      painter: LinePainter(),
                      child: SizedBox(
                        width: double.infinity,
                        child: widget.widget,
                      ),
                    ),
                  ),
                ],
              ),

              if(!widget.forCart)
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

  String nowDate(DateTime dateTime) {
    const weekDays = ['월', '화', '수', '목', '금', '토', '일'];
    String weekDay = weekDays[dateTime.weekday - 1];

    String period = dateTime.hour < 12 ? '오전' : '오후';
    int hour = dateTime.hour % 12;
    if (hour == 0) hour = 12;
    String minute = dateTime.minute.toString().padLeft(2, '0');

    return '${dateTime.year}. ${dateTime.month}. ${dateTime.day} ($weekDay) $period $hour시 $minute분';
  }
}

class LinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colours.blue
      ..strokeWidth = 0.8;

    for (double y = 0; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
