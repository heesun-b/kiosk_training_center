import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/pages/menu/menu_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_page.dart';
import 'package:kiosk_training_center/pages/start/start_page.dart';

class Routers {

  final GoRouter routers = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'start',
        builder: (_, __) {
          // return const StartPage();
          return const MenuPage();
        },
      ),
      GoRoute(
        path: '/select_people_and_method',
        name: 'select_people_and_method',
        builder: (_, __) {
          return const SelectPeopleAndMethodPage();
        },
      ),
      GoRoute(
        path: '/menu',
        name: 'menu',
        builder: (_, __) {
          return const MenuPage();
        },
      ),
    ],
  );

}
