import 'package:flutter/material.dart';

class Son with ChangeNotifier {
  int qiymat;

  Son(this.qiymat);

  void increment() {
    qiymat++;
    notifyListeners();
  }
}
