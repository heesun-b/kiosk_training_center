import 'package:kiosk_training_center/dto/cart.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';


class VideoPageState {
   Player player = Player();
   late VideoController controller = VideoController(player);
  // VideoPlayerController controller = VideoPlayerController.asset('');
  int currentIndex = 0;
  bool clickedScreen = false;
  bool clickedIconButton = false;
  bool initialized = false;

  List<Cart> cartList = [];
}