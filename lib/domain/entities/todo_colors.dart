import 'package:flutter/material.dart';

class TodoColors {
  final int colorIndex;

  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Color get color => predefinedColors[colorIndex];

  TodoColors({required this.colorIndex});


  factory TodoColors.empty() {
    return TodoColors(colorIndex: 0);
  }
}
