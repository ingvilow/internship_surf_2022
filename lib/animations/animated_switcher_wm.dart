import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/animation_model.dart';
import 'package:test_provider_2/animations/animation_switcher_demo/animated_switcher.dart';

class AnimateWM extends WidgetModel<AnimatedSwitcherScreen, AnimationModel>
    implements IAnimate {
  //утснавлиаем длительноть анимации
  final _duration = const Duration(milliseconds: 600);
  final StateNotifier<bool> _isRotates = StateNotifier();

  @override
  bool get isRotate => _isRotate;

  @override
  Duration get duration => _duration;

  @override
  ListenableState<bool> get isRotates => _isRotates;

  //по умолчанию true, если true, то контейнер красный, если false, то синий
  bool _isRotate = true;

  AnimateWM(AnimationModel model) : super(model);

  @override
  void initWidgetModel() {
    changeSwitchAnimate();
    super.initWidgetModel();
  }

  //анимирует смену цвета контейнера на экране
  @override
  void changeSwitchAnimate() {
    final result = _isRotate = !_isRotate;
    _isRotates.accept(result);
  }
}

AnimateWM createAnimateWM(BuildContext _) => AnimateWM(
      AnimationModel(),
    );

abstract class IAnimate extends IWidgetModel {
  bool get isRotate;

  ListenableState<bool> get isRotates;

  Duration get duration;

  void changeSwitchAnimate();
}
