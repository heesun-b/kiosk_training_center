import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';

class CountDownPage extends StatefulWidget {
  final List<Cart> cartList;
  const CountDownPage({super.key, required this.cartList});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {

  List<String> count = ['','10','9','8','7','6','5','4','3','2','1', ''];
  int currentIndex = 0;
  List<bool> textVisibility = List.filled(12, true);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentIndex < count.length) {
        setState(() {
          textVisibility[currentIndex] = false;
          currentIndex++;
        });
      } else {
        timer.cancel();
        GoRouter.of(context).go('/video', extra: widget.cartList);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.15, horizontal: size.width * 0.1),
          child: Column(
            children: [
              RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      color: Colours.pink5,
                      fontFamily: MyTextStyle.dungGeunMo,
                      letterSpacing: 4,
                      wordSpacing: 3,
                        height: 1.5
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: '영상이 '),
                      TextSpan(
                        text: '10초 ',
                        style: TextStyle(
                          color: Colours.green5,
                        ),
                      ),
                      TextSpan(text: '뒤 시작 됩니다.'),
                    ],
                  ),),
              // SizedBox(height: size.height * 0.08),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: size.width * 0.05,
                      color: Colours.pink5,
                      fontFamily: MyTextStyle.dungGeunMo,
                      letterSpacing: 4,
                      wordSpacing: 3,
                      height: 1.5
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '헤드폰 착용 후 ',
                      style: TextStyle(
                        color: Colours.blue3,
                      ),
                    ),
                    TextSpan(text: '관람해 주시기 바랍니다.')
                  ],
                ),),
              SizedBox(height: size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: count.asMap().entries.map((entry) {
                  int index = entry.key;
                  String text = entry.value;
                  return AnimatedOpacity(
                    opacity: textVisibility[index] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontFamily: MyTextStyle.dungGeunMo,
                          color: Colours.darkGrey,
                          fontSize: size.width * 0.05),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
