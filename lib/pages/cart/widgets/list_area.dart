import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class ListArea extends StatelessWidget {

  const ListArea({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return  SliverPadding (
        padding: EdgeInsets.only(left: size.width * 0.155, right: size.width * 0.155, top: size.height * 0.035, bottom:  size.height * 0.02),
        sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: provider.state.cartList.length,
                  (context, index) {
                return Row(
                  children: [
                    if(index == provider.state.cartList.length -1)
                      Text("+     ", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                    if(index != provider.state.cartList.length -1)
                      Text("       ", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                    Text("${provider.state.cartList[index].authorName},  ", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                    Text("${provider.state.cartList[index].workName},  ", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                    Text(provider.state.cartList[index].caption.substring(provider.state.cartList[index].caption.length - 7),style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                    SizedBox(width: size.width * 0.015),
                    Expanded(
                      child: CustomPaint(
                        painter: DashedLinePainter(),
                      ),
                    ),
                    SizedBox(width: size.width * 0.015),
                    Text("￦ ${provider.state.cartList[index].price}",style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015),),
                  ],
                );
              },
            )),
      );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colours.green3
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 3.0;
    var dashSpace = 3.0;
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