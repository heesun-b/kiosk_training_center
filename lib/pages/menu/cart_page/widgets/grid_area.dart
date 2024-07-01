import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/cart_page/cart_page.dart';

class GridArea extends StatelessWidget {
  final int peopleCount;
  final List<Cart> cartList;

  const GridArea({super.key, required this.cartList, required this.peopleCount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: cartList.length % 2 == 0 ? cartList.length : cartList.length + 1, (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index % 2 == 0 ? size.width * 0.03 : 0, right: index % 2 != 0 ? size.width * 0.03 : 0),
            child:  CustomPaint(
                painter: DashedBorderPainter(index: index, count : cartList.length),
                child: index == cartList.length ? null :
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.045, vertical: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('${changeNumToKr(index)} 영상', style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          const Expanded(child: Divider(thickness: 1.5,color: Colours.black,))
                        ],
                      ),
                      SizedBox(
                          width: size.width * 0.25,
                          height : size.height * 0.23,
                          child: Image.asset(cartList[index].workImage, fit: BoxFit.fill,)),
                      Text("${cartList[index].authorName} 예술가", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012)),
                      Text(cartList[index].caption, style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012, overflow: TextOverflow.visible )),
                      SizedBox(height: size.height * 0.01)
                    ],
                  ),
                ),
              ),
          );
        },
      ),
    );

  }
}

String changeNumToKr(int num) {
  var numList = ['첫 번째', '두 번째', '세 번째', '네 번째', '다섯 번째', '여섯 번째', '일곱 번째', '여덟 번째'];
  return numList[num];
}

class DashedBorderPainter extends CustomPainter {
  final int index;
  final int count;

  DashedBorderPainter({required this.index, required this.count});

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

    // Draw right border
    if(index % 2 == 0 && index != count -1) {
      double startY = 0;
      while (startY < size.height) {
        path.moveTo(size.width, startY);
        path.lineTo(size.width, startY + dashWidth);
        startY += dashWidth + dashSpace;
      }
    }

    // Draw bottom border
    startX = 0;
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