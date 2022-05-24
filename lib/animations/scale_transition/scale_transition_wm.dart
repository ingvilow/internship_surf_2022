import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_model.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

///ScaleTransition анимация
class ScaleTransitionWM
    extends WidgetModel<ScaleTransitionScreen, ScaleAnimationModels>
    with TickerProviderWidgetModelMixin
    implements IScaleAnimate {
  //эта анимация для разворачивания списка
  late final AnimationController _sizeTransitionController =
      AnimationController(
    duration: const Duration(minutes: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _sizeTransitionAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  final StateNotifier<bool> _isExpands = StateNotifier();

  //отвечает за анимацию флаттер лого
  //решила все-таки оставить разбиение на разные wm-ки под разные анимациии,
  //мне кажется, если свалить все в кучу, то в скором времени станет очень тяжело разобраться, что за что отвечает
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

  //анимация сворачивания списка
  @override
  Animation<double> get sizeTransitionAnimation => _sizeTransitionAnimation;

  @override
  AnimationController? get sizeTransitionController =>
      _sizeTransitionController;

  @override
  void dispose() {
    _sizeTransitionController.dispose();
    _controller.dispose();
    super.dispose();
  }

  //анимация смены цвета
  @override
  bool get isExpanded => _isExpanded;

  @override
  ListenableState<bool> get isExpands => _isExpands;

  bool _isExpanded = true;

  ScaleTransitionWM(ScaleAnimationModels model) : super(model);

  @override
  void changeColor() {
    final result = _isExpanded = !_isExpanded;
    _isExpands.accept(result);
  }
}

ScaleTransitionWM createScaleWM(BuildContext _) => ScaleTransitionWM(
      ScaleAnimationModels(),
    );

abstract class IScaleAnimate extends IWidgetModel {
  AnimationController? get controller;

  Animation<double> get scaleAnimation;

//анимация и контроллер для сворачивания списка
  AnimationController? get sizeTransitionController;

  Animation<double> get sizeTransitionAnimation;

  //смена цвета иконки и цвета иконки
  ListenableState<bool> get isExpands;

  bool get isExpanded;

  void changeColor();
}
