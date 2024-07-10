import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_fifth_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_first_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_fourth_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_second_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_third_step.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class PaymentPopUp extends StatefulWidget {
  const PaymentPopUp({super.key});

  @override
  State<PaymentPopUp> createState() => _PaymentPopUpState();
}

class _PaymentPopUpState extends State<PaymentPopUp> {
  AudioPlayer player = AudioPlayer();
  var isPlayedAudio = false;

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  void playAudio()  {

    setState(() {
      isPlayedAudio = true;
    });

      player.setAsset('assets/audios/sixth.mp3');
      player.setVolume(1.0);
      player.play();
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
              child: provider.state.currentPaymentStep == 0 ? PaymentFirstStep() :
              provider.state.currentPaymentStep == 1 ? PaymentSecondStep() :
              provider.state.currentPaymentStep == 2 ? PaymentThirdStep() :
              provider.state.currentPaymentStep == 3 ? PaymentFourthStep() : PaymentFifthStep()
              // child: PaymentFirstStep()
          );
        },
      ),
    );
  }
}


