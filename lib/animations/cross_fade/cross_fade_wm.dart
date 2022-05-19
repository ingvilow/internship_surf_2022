import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_animation.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_model.dart';

class CrossFadeWM extends WidgetModel<CrossFadeScreen, CrossFadeAnimationModel>
    implements IFadeAnimate {
  final _duration = const Duration(milliseconds: 600);
  final StateNotifier<bool> _isRotates = StateNotifier();

  @override
  bool get isRotate => _isRotate;

  @override
  Duration get duration => _duration;

  @override
  ListenableState<bool> get isRotates => _isRotates;

  bool _isRotate = true;

  CrossFadeWM(CrossFadeAnimationModel model) : super(model);

  @override
  void changeFadeAnimation() {
    final result = _isRotate = !_isRotate;
    _isRotates.accept(result);
  }
}

CrossFadeWM createFadeWM(BuildContext _) => CrossFadeWM(
      CrossFadeAnimationModel(),
    );

abstract class IFadeAnimate extends IWidgetModel {
  bool get isRotate;

  ListenableState<bool> get isRotates;

  Duration get duration;

  void changeFadeAnimation();
}
