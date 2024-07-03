import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_fifth_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_first_step.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class PaymentPopUp extends StatefulWidget {
  const PaymentPopUp({super.key});

  @override
  State<PaymentPopUp> createState() => _PaymentPopUpState();
}

class _PaymentPopUpState extends State<PaymentPopUp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.3, vertical: size.height * 0.05),
      child: Consumer<MenuProvider>(
        builder: (context, _, child) {
          return Container(
              decoration: const BoxDecoration(
                color: Colours.background,
              ),
              // child: provider.state.currentStep == 0 ? PaymentFirstStep() :
              // provider.state.currentStep == 1 ? PaymentSecondStep() :
              // provider.state.currentStep == 2 ? PaymentThirdStep() :
              // provider.state.currentStep == 3 ? PaymentFourthStep() : PaymentFifthStep()
              child: PaymentFirstStep()
          );
        },
      ),
    );
  }
}


