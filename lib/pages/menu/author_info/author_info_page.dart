import 'package:flutter/material.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/pages/menu/author_info/widgets/author_info_area.dart';
import 'package:kiosk_training_center/pages/menu/author_info/widgets/works_info_area.dart';

class AuthorInfoPage extends StatelessWidget {
  final Author author;
  final ScrollController scrollController;

  const AuthorInfoPage({super.key, required this.author, required this.scrollController});

  @override
  Widget build(BuildContext context) {

    return ListView(
      controller: scrollController,
      children: [
        AuthorInfoArea(author: author),
        WorksInfoArea(author: author),
        SizedBox(height:100)
      ],
    );
  }
}



