
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/common_widgets/my_button.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/cart/widgets/grid_area.dart';
import 'package:kiosk_training_center/pages/cart/widgets/list_area.dart';
import 'package:kiosk_training_center/pages/cart/widgets/payment_pop_up.dart';
import 'package:kiosk_training_center/pages/cart/widgets/total_price.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();
    var selectProvider =  context.watch<SelectPeopleAndMethodProvider>();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colours.green3, width: 10)
      ),
      child:BasePage(
              audioPath: 'assets/audios/fifth.mp3',
              forCart: true,
              peopleCount: provider.state.peopleCount,
              widget: provider.state.cartList.isEmpty ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("장바구니에 담긴 작품이 없습니다.", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.02),),
                  SizedBox(height: size.height * 0.2),
                  MyButton(onTap: () => Navigator.of(context).pop(), title: "닫기", width: size.width * 0.1, height: size.height * 0.06, fontSize: size.width * 0.02,)
                ],
              )

              : CustomScrollView(
                slivers: [
                  GridArea(),
                  if(provider.state.cartList.length % 2 != 0)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: CustomPaint(
                        painter: DashedLinePainter(),
                        child: Container(
                          width: double.infinity,
                          height: 2),
                      ),
                    ),
                  ),
                  ListArea(),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    sliver: const SliverToBoxAdapter(
                      child: Divider(
                        color: Colours.red, // 원하는 색상으로 변경
                        thickness: 2.0, // 원하는 두께로 변경
                      ),
                    ),
                  ),
                  TotalPrice(),
                  SliverPadding(
                    padding:EdgeInsets.symmetric(horizontal: size.width * 0.025, vertical: size.height * 0.02),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(onTap: () {
                            selectProvider.state.player.stop();
                            selectProvider.state.isPlayedAudio = false;
                            selectProvider.state.player2.stop();
                            selectProvider.state.isPlayedAudio2 = false;
                            Navigator.of(context).pop();
                          },
                              title: "뒤로가기", width: size.width * 0.1, height: size.height * 0.06, fontSize: size.width * 0.02),
                          MyButton(onTap: () {
                            selectProvider.state.player.stop();
                            selectProvider.state.isPlayedAudio = false;
                            selectProvider.state.player2.stop();
                            selectProvider.state.isPlayedAudio2 = false;
                            showPaymentPopUp();
                          }, title: "결제하기", width: size.width * 0.1, height: size.height * 0.06, fontSize: size.width * 0.02)
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
    );
  }

  void showPaymentPopUp() {

    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colours.black.withOpacity(0.7),
        builder: (context) {
          return PaymentPopUp();
        },);
  }

}


class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colours.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0;
    const dashSpace = 3.0;
    double startX = 0;
    final path = Path();

    while (startX < size.width) {
      path.moveTo(startX, size.height);
      path.lineTo(startX + dashWidth, size.height);
      startX += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



