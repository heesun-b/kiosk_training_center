import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class GridArea extends StatelessWidget {
  const GridArea({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: provider.state.cartList.length,
          // childCount: provider.state.cartList.length % 2 == 0 ? provider.state.cartList.length : provider.state.cartList.length + 1,
              (context, index) {
                return LongPressDraggable(
                  data: index,
                  feedback : SizedBox(
                      width: size.width * 0.26,
                      height : size.height * 0.23,
                      child: Image.asset(provider.state.cartList[index].workImage, fit: BoxFit.fill,)),
                  childWhenDragging: Opacity(
                      opacity: 0.7,
                      child: Padding(
                        padding: EdgeInsets.only(left: index % 2 == 0 ? size.width * 0.03 : 0, right: index % 2 != 0 ? size.width * 0.03 : 0),
                        child:  CustomPaint(
                          painter: DashedBorderPainter(index: index, count : provider.state.cartList.length),
                          child: index == provider.state.cartList.length ? Container() :
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045, vertical: size.height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text('${changeNumToKr(index)} 영상', style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 10),
                                    const Expanded(child: Divider(thickness: 1.5,color: Colours.black,))
                                  ],
                                ),
                                _buildItem(context, index, size)
                              ],
                            ),
                          ),
                        ),
                      )),
                  child: DragTarget(
                    onAcceptWithDetails: (details) {
                      int oldIndex = details.data as int;
                      provider.reorderCart(oldIndex, index);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Padding(
                        padding: EdgeInsets.only(left: index % 2 == 0 ? size.width * 0.03 : 0, right: index % 2 != 0 ? size.width * 0.03 : 0),
                        child:  CustomPaint(
                          painter: DashedBorderPainter(index: index, count : provider.state.cartList.length),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045, vertical: size.height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text('${changeNumToKr(index)} 영상', style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.015, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 10),
                                    const Expanded(child: Divider(thickness: 1.5,color: Colours.black,))
                                  ],
                                ),
                                _buildItem(context, index, size),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
          },
        ),
      );
  }

  Widget _buildItem(BuildContext context, int index, Size size) {
    // var provider = Provider.of<MenuProvider>(context, listen: true);
    var provider =  context.watch<MenuProvider>();
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
                width: size.width * 0.26,
                height : size.height * 0.23,
                child: Image.asset(provider.state.cartList[index].workImage, fit: BoxFit.fill,)),
            IconButton(onPressed: () => provider.deleteCart(index), icon: const Icon(CupertinoIcons.xmark_circle, color: Colours.white))
          ],
        ),
        SizedBox(height: size.height * 0.02,),
        Text("${provider.state.cartList[index].authorName} 예술가", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012)),
        Text(provider.state.cartList[index].caption, style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.012, overflow: TextOverflow.visible )),
        SizedBox(height: size.height * 0.01)
      ],
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
    // if(index % 2 == 0 && index != 0) {
    //   double startY = 0;
    //   while (startY < size.height) {
    //     path.moveTo(size.width, startY);
    //     path.lineTo(size.width, startY + dashWidth);
    //     startY += dashWidth + dashSpace;
    //   }
    // }

    if (index % 2 == 1 && index != 0) {
      double startY = 0;
      while (startY < size.height) {
        path.moveTo(0, startY);
        path.lineTo(0, startY + dashWidth);
        startY += dashWidth + dashSpace;
      }
    }

    // Draw bottom border
    if(index != count -1 || count % 2 == 0) {
      startX = 0;
      while (startX < size.width) {
        path.moveTo(startX, size.height);
        path.lineTo(startX + dashWidth, size.height);
        startX += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.index != index || oldDelegate.count != count;
  }
}
