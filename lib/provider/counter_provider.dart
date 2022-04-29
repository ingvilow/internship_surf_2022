import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int get counter => _count;
  var _count = 0;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
