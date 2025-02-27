import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/cart/cart_page.dart';
import 'package:kiosk_training_center/pages/menu/author_info/author_info_page.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/menu/project_info/project_info_page.dart';
import 'package:kiosk_training_center/pages/menu/usage_info/usage_info_page.dart';
import 'package:kiosk_training_center/pages/menu/widgets/menu_button.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_provider.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  final int peopleCount;
  const MenuPage({super.key, required this.peopleCount});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MenuProvider>(context, listen: false).init(widget.peopleCount);
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Provider.of<MenuProvider>(context, listen: false).state.pageController.dispose();
    // Provider.of<MenuProvider>(context, listen: false).state.scrollController1.dispose();
    // Provider.of<MenuProvider>(context, listen: false).state.scrollController2.dispose();
    // Provider.of<MenuProvider>(context, listen: false).state.scrollController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<MenuProvider>();
    var selectProvider =  context.watch<SelectPeopleAndMethodProvider>();

    return BasePage(
          audioPath: provider.state.currentPage == 0 ? 'assets/audios/third.mp3'
              : provider.state.currentPage ==  1 ? 'assets/audios/help.mp3' : 'assets/audios/fourth.mp3',
          peopleCount: widget.peopleCount,
          widget: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.035, right: size.width * 0.07, bottom: size.height * 0.04,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Column(
                          children: List.generate(
                              5,
                              (index) => MenuButton(
                                // verticalPadding: index == 1 ? 20.0 : 10.0,
                                verticalPadding: 20.0,
                                onTap: () => provider.navigateToPage(index),
                                text: provider.state.menu[index],
                                selected: provider.state.currentPage == index ? true : false,
                                count: index > 1 && provider.countCartList(provider.state.menu[index]) > 0
                                    ? provider.countCartList(provider.state.menu[index]).toString()
                                    : null,
                              )
                          ),
                        ),
                      ],
                    ),

                    MenuButton(
                      onTap: () {
                        selectProvider.state.player.stop();
                        selectProvider.state.isPlayedAudio = false;
                        selectProvider.state.player2.stop();
                        selectProvider.state.isPlayedAudio2 = false;
                        showCart();
                      },
                      text:  '장바구니',
                      selected:  false,
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  physics: provider.state.currentPage == 0 || provider.state.currentPage == 1 ? NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
                  controller: provider.state.pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    selectProvider.state.player.stop();
                    selectProvider.state.isPlayedAudio = false;
                    selectProvider.state.player2.stop();
                    selectProvider.state.isPlayedAudio2 = false;
                    provider.selectPage(value.floor());
                  },
                  children: [
                    ProjectInfoPage(),
                    UsageInfoPage(),
                    AuthorInfoPage(author: provider.state.author[0], scrollController: provider.state.scrollController1),
                    AuthorInfoPage(author: provider.state.author[1],   scrollController: provider.state.scrollController2),
                    AuthorInfoPage(author: provider.state.author[2],  scrollController: provider.state.scrollController3),
                  ],
                ),
              )
            ],
          )
      );
  }

  void showCart() {
    var size = MediaQuery.of(context).size;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.12, vertical: size.height * 0.1),
            child: CartPage()
        );
      },);
  }
}
