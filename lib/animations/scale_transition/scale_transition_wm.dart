import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  // final Duration _duration = const Duration(milliseconds: 600);
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  ListenableState<Animation<double>>? get animation =>
      throw UnimplementedError();
  @override
  AnimationController? get controller => _controller;

  @override
  void animate() {
    AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animation!,
      curve: Curves.bounceIn,
    );
  }

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);
}

ScaleTransitionWM createScaleWM(BuildContext _) => ScaleTransitionWM(
      ScaleAnimationModels(),
    );

abstract class IScaleAnimate extends IWidgetModel {
  AnimationController? get controller;

  ListenableState<Animation<double>>? get animation;

  void animate();
}
