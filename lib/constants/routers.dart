import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/count_down/count_down_page.dart';
import 'package:kiosk_training_center/pages/loading_pop_up.dart';
import 'package:kiosk_training_center/pages/menu/menu_page.dart';
import 'package:kiosk_training_center/pages/receipt/receipt_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_page.dart';
import 'package:kiosk_training_center/pages/start/start_page.dart';
import 'package:kiosk_training_center/pages/video/video_page.dart';

class Routers {

  final GoRouter routers = GoRouter(
    initialLocation: '/receipt',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'loading',
        builder: (_, __) {
          return const LoadingPopUp();
          // return MenuPage(peopleCount: 1);
          // return ReceiptPage();
        },
      ),
      GoRoute(
        path: '/start',
        name: 'start',
        builder: (_, __) {
          return const StartPage();
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
        builder: (context, state) {
          return MenuPage(peopleCount: state.extra as int);
        },
      ),
      GoRoute(
        path: '/count_down',
        name: 'count_down',
        builder: (context, state) {
          return CountDownPage(cartList: state.extra as List<Cart>);
        },
      ),
      GoRoute(
        path: '/video',
        name: 'video',
        builder: (context, state) {
          return VideoPage(cartList: state.extra as List<Cart>);
        },
      ),
      GoRoute(
        path: '/receipt',
        name: 'receipt',
        builder: (context, state) {
          return ReceiptPage();
        },
      ),
    ],
  );

}
