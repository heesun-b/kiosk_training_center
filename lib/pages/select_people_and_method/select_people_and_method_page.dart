import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/criteria_size.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/widgets/counter_people.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/widgets/select_method.dart';
import 'package:provider/provider.dart';

class SelectPeopleAndMethodPage extends StatefulWidget {
  const SelectPeopleAndMethodPage({super.key});

  @override
  State<SelectPeopleAndMethodPage> createState() => _SelectPeopleAndMethodPageState();
}

class _SelectPeopleAndMethodPageState extends State<SelectPeopleAndMethodPage> {
  final provider = SelectPeopleAndMethodProvider();

  @override
  void initState() {
    super.initState();
    provider.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: provider,
        builder: (context, child) => _buildPage(context));
  }

  Widget _buildPage(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BasePage(
      widget: Padding(
        padding: EdgeInsets.only(right: size.width * 0.15, left:  size.width * 0.3, bottom: size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountPeople(),
            SizedBox(height: 50),
            SelectMethod(),
          ],
        ),
      ),
    );
  }

}

