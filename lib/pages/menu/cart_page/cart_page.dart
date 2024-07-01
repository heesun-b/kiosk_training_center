
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/menu/cart_page/widgets/grid_area.dart';

class CartPage extends StatelessWidget {
  final int peopleCount;
  final List<Cart> cartList;

  const CartPage({super.key, required this.peopleCount, required this.cartList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colours.green3, width: 10)
      ),
      child: BasePage(
        audioPath: 'assets/audios/sample.mp3',
        forCart: true,
        peopleCount: peopleCount,
        widget:CustomScrollView(
          slivers: [
            GridArea(cartList: cartList, peopleCount: peopleCount),
            // SliverList(delegate: delegate)
          ],
        )
      ),
    );
  }
}

