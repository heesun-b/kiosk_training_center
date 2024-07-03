import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class TotalPrice extends StatelessWidget {

  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();

    return  SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.01),
        sliver: SliverToBoxAdapter(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("총 금액 ", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.025),),
                  Container(
                    width: size.width * 0.15,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colours.black, width: 1.5)
                        )
                    ),
                  ),
                  SizedBox(width: size.width * 0.05,)
                ],
              ),
              Positioned(
                  right: size.width * 0.055,
                  child: Text("${provider.state.cartList.length * 3}원", style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.02) ))
            ],
          ),
        ),
      );
  }
}
