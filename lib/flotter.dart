import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'src/animationController.dart';
export 'src/animationController.dart';

class FlotterAnimation extends StatelessWidget {
  FlotterAnimation(this.controller,
      {this.height = double.infinity, this.width = double.infinity});

  // Parameters
  final FlotterAnimationController controller;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (!controller.isInitialized) controller.init();

    // UIKitView parameters
    Map<String, String> creationParamsMap = {};
    creationParamsMap['animationId'] = controller.animationId;
    creationParamsMap['animationData'] = controller.animationData;

    if (Platform.isIOS)
      return Container(
        width: width,
        height: height,
        
        child: UiKitView(
          viewType: 'FlotterAnimation',
          creationParams: creationParamsMap,
          creationParamsCodec: StandardMessageCodec(),
          onPlatformViewCreated: null,
        ),
      );
    else
      return Text('Not available on android yet.');
  }
}
