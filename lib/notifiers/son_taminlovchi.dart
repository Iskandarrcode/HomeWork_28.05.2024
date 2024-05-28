import 'package:dars5/models/son.dart';
import 'package:flutter/material.dart';

class SonTaminlovchi extends InheritedWidget {
  final Son son;

  const SonTaminlovchi({
    super.key,
    required this.son,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SonTaminlovchi oldWidget) {
    return oldWidget.son != son;
  }

  static SonTaminlovchi uzingniQaytar(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SonTaminlovchi>()!;
  }
}