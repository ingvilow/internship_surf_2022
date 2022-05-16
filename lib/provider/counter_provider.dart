import 'package:flutter/cupertino.dart';

//класс счетчика
class Counter extends ChangeNotifier {
  int get counter => _count;
  var _count = 0;

  //функция для увеличения значения на 1
  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
