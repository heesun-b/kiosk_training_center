import 'package:flutter/material.dart';
import 'package:kiosk_training_center/common_widgets/my_button.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class PaymentFirstStep extends StatelessWidget {
  const PaymentFirstStep({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();
    
    return Consumer<MenuProvider>(
      builder: (context, _, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("결제방법", style: TextStyle(fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.055, color: Colours.darkGrey, letterSpacing: 3, decoration: TextDecoration.none)),
            GestureDetector(
              onTap: () => provider.clickedPaymentFirstButton(),
              child: Container(
                width: size.width * 0.22,
                height: size.height * 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:  const EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colours.green4,
                    borderRadius: BorderRadius.circular(10),
                    border: provider.state.clickedFirstStep ? Border.all(color: Colours.blue, width: 5) : null
                ),
                child: Text("키오스크 트레이닝 센터\n전용 카드 사용", style: TextStyle(color: Colours.red, fontFamily: MyTextStyle.dungGeunMo, fontSize: size.width * 0.015, decoration: TextDecoration.none, letterSpacing: 2, wordSpacing: 2, height: 1.5),textAlign: TextAlign.center),
              ),
            ),
            MyButton(onTap: provider.state.clickedFirstStep ? () => provider.nextPaymentStep(): (){}, title: "선택", width: size.width * 0.09, height: size.height * 0.07, fontSize: size.width *0.025)
          ],
        );
      },
);
  }
}
