import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_training_center/constants/colours.dart';
import 'package:kiosk_training_center/constants/my_text_style.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/pages/menu/menu_provider.dart';
import 'package:kiosk_training_center/pages/video/video_provider.dart';
import 'package:kiosk_training_center/pages/video/widgets/stop_screen.dart';
import 'package:kiosk_training_center/pages/video/widgets/video_button.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  final List<Cart> cartList;
  const VideoPage({super.key, required this.cartList});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VideoProvider>(context, listen: false).init(widget.cartList);
      Provider.of<VideoProvider>(context, listen: false).addController();
    });
  }

  @override
  void dispose() {
    // Provider.of<VideoProvider>(context, listen: false).state.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider =  context.watch<VideoProvider>();

    return Stack(
            children: [
              Video(controller: provider.state.controller),
              provider.state.initialized ? StopScreen() : Container(),
              AnimatedOpacity(
                opacity: provider.state.clickedScreen ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(onPressed: () => provider.clickedIconButton(), icon: Icon(CupertinoIcons.clear_circled, color: Colours.white, size: size.width * 0.08,)),
                    )),
              )
            ]);
  }
}
