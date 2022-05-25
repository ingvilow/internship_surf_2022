import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/cross_fade/cross_fade_wm.dart';

class CrossFadeScreen extends ElementaryWidget<IFadeAnimate> {
  const CrossFadeScreen({
    Key? key,
    WidgetModelFactory wmFactory = createFadeWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFadeAnimate wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: wm.isFades,
              builder: (context, value, child) {
                return AnimatedCrossFade(
                  firstChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.indigoAccent,
                  ),
                  secondChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blueGrey,
                  ),
                  crossFadeState: value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: duration,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: wm.changeFadeAnimation,
            child: const Text('fade changes'),
          ),
        ],
      ),
    );
  }
}
