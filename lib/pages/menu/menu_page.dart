import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/pages/base_page.dart';
import 'package:kiosk_training_center/pages/menu/author_info/author_info_page.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/menu/project_info/project_info_page.dart';
import 'package:kiosk_training_center/pages/menu/usage_info/usage_info_page.dart';
import 'package:kiosk_training_center/pages/menu/widgets/menu_button.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final provider = MenuProvider();

  @override
  void initState() {
    super.initState();
    provider.init();
  }

  @override
  void dispose() {
    super.dispose();
    provider.state.pageController.dispose();
    provider.state.scrollController1.dispose();
    provider.state.scrollController2.dispose();
    provider.state.scrollController3.dispose();
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
        widget: Consumer<MenuProvider>(
          builder: (context, provider, child) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.035, right: size.width * 0.07, bottom: size.height * 0.04,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Column(
                            children: List.generate(
                                5,
                                (index) => MenuButton(
                                  onTap: () => provider.navigateToPage(index),
                                  text: provider.state.menu[index],
                                  selected: provider.state.currentPage == index ? true : false,
                                  count: index == 2 || index == 3 || index == 4 ? provider.state.author[index -2].works.length.toString() : null,
                                )
                            ),
                          ),
                          MenuButton(
                            onTap: () {},
                            text: '장바구니',
                            selected: false,
                          ),
                        ],
                      ),

                      MenuButton(
                        onTap: () {},
                        text:  '결제',
                        selected:  false,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: provider.state.pageController,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (value) => provider.selectPage(value.floor()),
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
            );
          },
        )
    );
  }
}
