import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_animation.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_model.dart';

class CrossFadeWM extends WidgetModel<CrossFadeScreen, CrossFadeAnimationModel>
    implements IFadeAnimate {
  final _duration = const Duration(milliseconds: 600);
  final StateNotifier<bool> _isRotates = StateNotifier();
  final StateNotifier<Color> _isColor = StateNotifier();
  final Color _colorsTwo = Colors.yellow;

  @override
  bool get isRotate => _isRotate;

  @override
  Duration get duration => _duration;

  @override
  ListenableState<bool> get isRotates => _isRotates;

  @override
  ListenableState<Color> get color => _isColor;

  @override
  Color get defaultColor => _colorsOne;

  bool _isRotate = true;
  Color _colorsOne = Colors.purple;

  CrossFadeWM(CrossFadeAnimationModel model) : super(model);

  //aнимация плавной смены цвета контейнера
  @override
  void changeFadeAnimation() {
    final result = _isRotate = !_isRotate;
    _isRotates.accept(result);
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
  bool get isRotate;

  Color get defaultColor;

  ListenableState<bool> get isRotates;

  Duration get duration;

  ListenableState<Color> get color;

  void changeFadeAnimation();

  void changeIconColor();
}
