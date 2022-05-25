import 'package:flutter/material.dart';
import 'package:test_provider_2/animations/scale_transition/scale_transition_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScaleTransitionScreen(),
    );
  }
}
