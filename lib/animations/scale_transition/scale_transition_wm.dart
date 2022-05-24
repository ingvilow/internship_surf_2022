import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  late final AnimationController _sizeTransitionController =
      AnimationController(
    duration: const Duration(minutes: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _sizeTransitionAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  final ValueNotifier<bool> _isExpands = ValueNotifier(false);

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 15),
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

  @override
  ValueListenable<bool> get isExpands => _isExpands;

  @override
  Animation<double> get sizeTransitionAnimation => _sizeTransitionAnimation;

  @override
  AnimationController? get sizeTransitionController =>
      _sizeTransitionController;

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);

  @override
  void dispose() {
    _sizeTransitionController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void changeColor() {
    _isExpands.value = !_isExpands.value;
  }
}

ScaleTransitionWM createScaleWM(BuildContext _) => ScaleTransitionWM(
      ScaleAnimationModels(),
    );

abstract class IScaleAnimate extends IWidgetModel {
  /// эти контроллеры отвечают за анимацию флаттер-лого
  AnimationController? get controller;

  Animation<double> get scaleAnimation;

  /// анимация и контроллер для сворачивания списка
  AnimationController? get sizeTransitionController;

  Animation<double> get sizeTransitionAnimation;

  /// смена иконки и цвета иконки
  ValueListenable<bool> get isExpands;

  void changeColor();
}
