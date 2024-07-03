import 'package:kiosk_training_center/dto/cart.dart';
import 'package:video_player/video_player.dart';

class VideoState {
  VideoPlayerController controller = VideoPlayerController.asset('');
  int currentIndex = 0;
  bool clickedScreen = false;
  bool clickedIconButton = false;
  bool initialized = false;

  List<Cart> cartList = [];
}