import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/count_down/count_down_page.dart';
import 'package:kiosk_training_center/pages/menu/menu_page.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_page.dart';
import 'package:kiosk_training_center/pages/start/start_page.dart';
import 'package:kiosk_training_center/pages/video/video_page.dart';

class Routers {

  final GoRouter routers = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'start',
        builder: (_, __) {
          return const StartPage();
          // return const MenuPage(peopleCount: 1,);

          // return VideoPage(
          //   cartList: [
          //     Cart(
          //         authorName: '최지목',
          //         workName: '아버지와의 대화',
          //         workImage: 'assets/images/works/a_dialogue_between_father_and_son.png',
          //         workVideo:  'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2F%E1%84%8B%E1%85%A1%E1%84%87%E1%85%A5%E1%84%8C%E1%85%B5%E1%84%8B%E1%85%AA%E1%84%8B%E1%85%B4%20%E1%84%83%E1%85%A2%E1%84%92%E1%85%AA%20%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%B3%E1%86%AF%E1%84%8C%E1%85%A1%E1%84%86%E1%85%A1%E1%86%A8.MP4?alt=media&token=42d08934-dfde-49c1-a457-d9a428a32140',
          //         caption: '2021, 퍼포먼스 비디오, 단채널, 컬러, 사운드, 20분 07초',
          //         price: 3),
          //     Cart(
          //         authorName: '최지목',
          //         workName: '흰석기 시대',
          //         workImage: 'assets/images/works/white_stone_age.png',
          //         workVideo:  'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2F%E1%84%92%E1%85%B4%E1%86%AB%E1%84%89%E1%85%A5%E1%86%A8%E1%84%80%E1%85%B5%E1%84%89%E1%85%B5%E1%84%83%E1%85%A2.MP4?alt=media&token=caf84310-9b4c-4e54-8ce8-36bfb9c7f9ba',
          //         caption: '2021, 인터뷰 비디오, 단채널, 컬러, 사운드, 26분 45초',
          //         price: 3),
          //
          //   ],
          //
          // );
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
    ],
  );

}
