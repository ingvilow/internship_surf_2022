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
              scale: wm.scaleAnimation,
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
                        icon: value
                            ? const Icon(
                                Icons.favorite_border,
                                color: Colors.purple,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ),
                        onPressed: wm.changeColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
