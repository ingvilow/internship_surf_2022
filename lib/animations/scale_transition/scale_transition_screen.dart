import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_wm.dart';

class ScaleTransitionScreen extends ElementaryWidget<IScaleAnimate> {
  const ScaleTransitionScreen({
    Key? key,
    WidgetModelFactory wmFactory = createScaleWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IScaleAnimate wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale and Fade Transition'),
      ),
    );
  }
}
