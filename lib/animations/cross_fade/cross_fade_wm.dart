import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_animation.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_model.dart';

class CrossFadeWM extends WidgetModel<CrossFadeScreen, CrossFadeAnimationModel>
    implements IFadeAnimate {
  final _duration = const Duration(milliseconds: 600);
  final StateNotifier<bool> _isFades = StateNotifier();
  final StateNotifier<Color> _isColor = StateNotifier();
  final Color _colorsTwo = Colors.yellow;

  @override
  Duration get duration => _duration;

  @override
  bool get isFade => _isFade;

  @override
  ListenableState<bool> get isFades => _isFades;

  @override
  ListenableState<Color> get color => _isColor;

  @override
  Color get defaultColor => _colorsOne;

  bool _isFade = true;
  Color _colorsOne = Colors.purple;

  CrossFadeWM(CrossFadeAnimationModel model) : super(model);

  //aнимация плавной смены цвета контейнера
  @override
  void changeFadeAnimation() {
    final result = _isFade = !_isFade;
    _isFades.accept(result);
  }

  //меняет цвет иконки
  @override
  void changeIconColor() {
    final result = _colorsOne = _colorsTwo;
    _isColor.accept(result);
  }
}

CrossFadeWM createFadeWM(BuildContext _) => CrossFadeWM(
      CrossFadeAnimationModel(),
    );

abstract class IFadeAnimate extends IWidgetModel {
  bool get isFade;

  Color get defaultColor;

  ListenableState<bool> get isFades;

  Duration get duration;

  ListenableState<Color> get color;

  void changeFadeAnimation();

  void changeIconColor();
}
