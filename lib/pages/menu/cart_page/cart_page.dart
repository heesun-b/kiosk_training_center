
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/base_page.dart';

class CartPage extends StatelessWidget {
  final int peopleCount;
  final List<Cart> cartList;

  const CartPage({super.key, required this.peopleCount, required this.cartList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BasePage(
      audioPath: 'assets/audios/sample.mp3',
      forCart: true,
      peopleCount: peopleCount,
      widget:CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: cartList.length % 2 == 0 ? cartList.length : cartList.length + 1,
              (context, index) {
                return CustomPaint(
                  painter: DashedBorderPainter(index: index, count : cartList.length),
                  child: index == cartList.length ? null :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('${changeNumToKr(index)} 영상', style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015)),
                              const SizedBox(width: 10),
                              const Expanded(child: Divider(thickness: 1,color: Colours.black,))
                            ],
                          ),
                          SizedBox(
                              width: size.width * 0.35,
                              height : size.height * 0.3,
                              child: Image.asset(cartList[index].workImage, fit: BoxFit.fill,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${cartList[index].authorName} 예술가", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012)),
                              SizedBox(width: size.width * 0.015),
                              Text(cartList[index].caption, style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012)),
                            ],
                          )
                        ],
                      ),
                );
              },
            ),
          )
        ],
      )
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

    const dashWidth = 5.0;
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