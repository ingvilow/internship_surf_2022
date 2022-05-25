import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_wm.dart';

class ScaleTransitionScreen extends ElementaryWidget<IScaleAnimate> {
  const ScaleTransitionScreen({
    Key? key,
    WidgetModelFactory wmFactory = createScaleWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IScaleAnimate wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ScaleTransition(
              scale: wm.sizeTransitionAnimation,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(size: 150.0),
              ),
            ),
          ),
          ExpansionTile(
            title: const Text(
              'Header',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_drop_down),
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: wm.isExpands,
                builder: (context, value, child) {
                  return SizeTransition(
                    sizeFactor: wm.sizeTransitionAnimation,
                    child: ListTile(
                      title: const Text('important data 1'),
                      trailing: IconButton(
                        icon: AnimatedSwitcher(
                          duration: duration,
                          child: value
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.purple,
                                  key: UniqueKey(),
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  key: UniqueKey(),
                                ),
                        ),
                        onPressed: wm.changeColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          AnimatedBuilder(
            animation: wm.myAnimationTween,
            builder: (context, child) {
              return Container(
                height: wm.myAnimationTween.value.height,
                width: wm.myAnimationTween.value.width,
                child: Center(
                  child: child,
                ),
                color: Colors.yellow,
              );
            },
            child: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
    );
  }
}
