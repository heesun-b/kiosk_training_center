import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_fifth_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_first_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_fourth_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_second_step.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_third_step.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PaymentPopUp extends StatefulWidget {
  const PaymentPopUp({super.key});

  @override
  State<PaymentPopUp> createState() => _PaymentPopUpState();
}

class _PaymentPopUpState extends State<PaymentPopUp> {
  Player player = Player();
  var isPlayedAudio = false;

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playAudio() async {

    setState(() {
      isPlayedAudio = true;
    });

      await loadAssetAndPlay('assets/audios/sixth.mp3', player);
      // player.setAsset('assets/audios/sixth.mp3');
      player.setVolume(100.0);
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
              child: provider.state.currentPaymentStep == 0 ? PaymentFirstStep(audioPlayer: player) :
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

Future<void> loadAssetAndPlay(String path, Player player) async {
  // assets/audio/first.mp3 파일을 ByteData로 읽기
  ByteData data = await rootBundle.load(path);
  // 임시 디렉토리에 파일 저장
  Directory tempDir = await getTemporaryDirectory();
  String lastPart = path.split('/').last;
  File tempFile = File('${tempDir.path}/$lastPart');
  await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

  // 저장된 파일을 재생
  await player.open(Media(tempFile.path));
}


