import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // 디바이스 화면 너비 반환
  double get deviceWidth => MediaQuery.of(this).size.width;

  // 디바이스 화면 옾이 반환
  double get deviceHeight => MediaQuery.of(this).size.height;
}
