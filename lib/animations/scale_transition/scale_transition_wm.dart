import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

/// длительность анимации смены цвета иконки
const duration = Duration(milliseconds: 600);

class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  @override
  late final Animation<double> sizeTransitionAnimation = CurvedAnimation(
    parent: _sizeTransitionController,
    curve: Curves.linear,
  );

  late final AnimationController _sizeTransitionController =
      AnimationController(
    duration: const Duration(seconds: 40),
    vsync: this,
  )..repeat(reverse: true);

  final ValueNotifier<bool> _isExpands = ValueNotifier(false);

  late final Animation<Size> _myAnimation = Tween<Size>(
    begin: const Size(100, 100),
    end: const Size(50, 120),
  ).animate(
    CurvedAnimation(parent: _sizeTransitionController, curve: Curves.bounceIn),
  );

  @override
  ValueListenable<bool> get isExpands => _isExpands;

  @override
  Animation<Size> get myAnimationTween => _myAnimation;

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);

  @override
  void dispose() {
    _sizeTransitionController.dispose();
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
  /// анимация  для сворачивания списка
  Animation<double> get sizeTransitionAnimation;

  /// анимация для TweenAnimation
  Animation<Size> get myAnimationTween;

  /// смена иконки и цвета иконки
  ValueListenable<bool> get isExpands;

  void changeColor();
}
