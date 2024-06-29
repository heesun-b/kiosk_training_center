import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class AuthorInfoArea extends StatelessWidget {
  final Author author;
  const AuthorInfoArea({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.03),
        Text(changeName(author.name), style: TextStyle(fontSize: size.width * 0.025 , fontFamily: MyTextStyle.ownglyphJooreeletter, fontWeight: FontWeight.bold)),
        SizedBox(height: size.height * 0.01),
        Consumer<MenuProvider>(
          builder: (context, provider, child) {
            return FutureBuilder(
              future: provider.loadAsset(author.infoPath),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.only(right: size.width * 0.05),
                    child: Text(snapshot.data.toString(), style: TextStyle(fontSize: size.width * 0.017, fontFamily: MyTextStyle.humanBeomseok, height: 1.7),textAlign: TextAlign.justify),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(color: Colours.pink1),
                  );
                }
              },
            );
          },
        )
      ],
    );
  }
}

String changeName(String name) {
  List<String> names = name.split('');
  String result = '';

  for (var element in names) {
    result += '$element ';
  }

  return '$result 작가';
}