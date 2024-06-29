import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:provider/provider.dart';


class SelectMethod extends StatelessWidget {
  const SelectMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<SelectPeopleAndMethodProvider>(
        builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("감상 방법 선택", style: TextStyle(fontFamily: MyTextStyle.computersetak, fontWeight: FontWeight.w500, fontSize: size.width >= CriteriaSize.widthSize2 ? 30 : 25)),
            InkWell(
              onTap: () => provider.changeSelect(),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: provider.state.selected ? Colours.pink4 : Colours.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                    color: Colours.pink1,
                    width: 1,
                  ),
                ),
                child: const Text('매장에서 영상 보기',style: TextStyle(fontFamily: MyTextStyle.kimjungchulGothic, fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        );
        },
);
  }
}

