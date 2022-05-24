import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

///ScaleTransition анимация
class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  //отвечает за анимацию флаттер лого
  //решила все-таки оставить разбиение на разные wm-ки под разные анимациии,
  //мне кажется, если свалить все в кучу, то в скором времени станет очень тяжело разобраться, что за что отвечает
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  AnimationController? get controller => _controller;

  @override
  Animation<double> get scaleAnimation => _animation;

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);
}

ScaleTransitionWM createScaleWM(BuildContext _) => ScaleTransitionWM(
      ScaleAnimationModels(),
    );

abstract class IScaleAnimate extends IWidgetModel {
  AnimationController? get controller;

  Animation<double> get scaleAnimation;
}
