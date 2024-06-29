import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class WorksInfoArea extends StatelessWidget {
  final Author author;
  const WorksInfoArea({super.key, required this.author});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05),
        Text('감상 가능 작품', style: TextStyle(fontSize: size.width * 0.025 , fontFamily: MyTextStyle.ownglyphJooreeletter, fontWeight: FontWeight.bold)),
        SizedBox(height: size.height * 0.02),
        Column(
          children: List.generate(
              author.works.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.07),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: size.width * 0.35,
                                  height: size.height * 0.3,
                                  child: Image.asset(author.works[index].imagePath, fit: BoxFit.cover)),
                              const SizedBox(height: 5),
                              Text(author.works[index].caption, style: TextStyle(fontFamily: MyTextStyle.humanBeomseok, fontSize: size.width * 0.013),)

                            ],
                          ),
                    Consumer<MenuProvider>(
                      builder: (context, provider, child) {
                        return Expanded(
                          child: FutureBuilder(
                            future: provider.loadAsset(author.works[index].infoPath.toString()),
                            builder: (context, snapshot) {
                              if(snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 50.0),
                                  child: Text(snapshot.data.toString(), style: TextStyle(fontSize: size.width * 0.017, fontFamily: MyTextStyle.humanBeomseok, height: 1.7),textAlign: TextAlign.justify,),
                                );
                              } else {
                                return  Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: size.width * 0.2),
                                  child: CircularProgressIndicator(color: Colours.pink1),
                                );
                              }
                            },
                          ),
                        );
                      },
                    )
                                    ],
                                  ),
                  )),
        )
      ],
    );
  }
}
