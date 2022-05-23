import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  final Duration _duration = const Duration(milliseconds: 600);
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  Animation<double>? get animation => _animation;

  @override
  AnimationController? get controller => _controller;

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);
}

ScaleTransitionWM createScaleWM(BuildContext _) => ScaleTransitionWM(
      ScaleAnimationModels(),
    );

abstract class IScaleAnimate extends IWidgetModel {
  AnimationController? get controller;

  Animation<double>? get animation;
}
