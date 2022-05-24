import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/animation_switcher_demo/animated_switcher.dart';
import 'package:test_provider_2/animations/animation_switcher_demo/animation_model.dart';

//устанавливаем длительноть анимации
const duration = Duration(milliseconds: 600);

class AnimateWM extends WidgetModel<AnimatedSwitcherScreen, AnimationModel>
    implements IAnimate {
  final ValueNotifier<bool> _isRotates = ValueNotifier(false);

  @override
  ValueListenable<bool> get isRotates => _isRotates;

  AnimateWM(AnimationModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void changeSwitchAnimate() {
    _isRotates.value = !_isRotates.value;
  }
}

AnimateWM createAnimateWM(BuildContext _) => AnimateWM(
      AnimationModel(),
    );

abstract class IAnimate extends IWidgetModel {
  ValueListenable<bool> get isRotates;

  ///анимирует смену цвета контейнера на экране
  void changeSwitchAnimate();
}
