import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/animation_switcher_demo/animated_switcher_wm.dart';

class AnimatedSwitcherScreen extends ElementaryWidget<IAnimate> {
  const AnimatedSwitcherScreen({
    Key? key,
    WidgetModelFactory wmFactory = createAnimateWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAnimate wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: wm.isRotates,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: duration,
                  switchInCurve: Curves.bounceInOut,
                  child: value
                      ? Container(
                          key: UniqueKey(),
                          color: Colors.indigo,
                          width: 200,
                          height: 200,
                        )
                      : Container(
                          key: UniqueKey(),
                          color: Colors.red,
                          width: 200,
                          height: 200,
                        ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: wm.changeSwitchAnimate,
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }
}
