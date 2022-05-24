import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_animation.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_model.dart';

const duration = Duration(milliseconds: 600);

class CrossFadeWM extends WidgetModel<CrossFadeScreen, CrossFadeAnimationModel>
    implements IFadeAnimate {
  final ValueNotifier<bool> _isFades = ValueNotifier(false);

  @override
  ValueListenable<bool> get isFades => _isFades;

  CrossFadeWM(CrossFadeAnimationModel model) : super(model);

  @override
  void changeFadeAnimation() {
    _isFades.value = !_isFades.value;
  }
}

CrossFadeWM createFadeWM(BuildContext _) => CrossFadeWM(
      CrossFadeAnimationModel(),
    );

abstract class IFadeAnimate extends IWidgetModel {
  ValueListenable<bool> get isFades;

  ///aнимация плавной смены цвета контейнера
  void changeFadeAnimation();
}
