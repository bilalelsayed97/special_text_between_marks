import 'package:flutter/material.dart';
import 'package:special_text_between_marks/src/bold_between_marks.dart';

// Context class that uses a TextStrategy
class TextFormatter {
  final TextStrategy strategy;

  TextFormatter(this.strategy);

  TextSpan format(String text, String openMark, String closeMark,
      TextStyle? normalStyle, TextStyle? specialStyle) {
    return strategy.format(
        text, openMark, closeMark, normalStyle, specialStyle);
  }
}
