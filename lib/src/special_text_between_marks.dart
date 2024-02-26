import 'package:flutter/material.dart';
import 'package:special_text_between_marks/src/bold_between_marks.dart';
import 'package:special_text_between_marks/src/text_formatter.dart';

class SpecialTextBetweenMarks extends StatelessWidget {
  final String text;
  final String openMark;
  final String closeMark;
  final TextStyle? normalStyle;
  final TextStyle? specialStyle;

  const SpecialTextBetweenMarks(
      {super.key,
      required this.text,
      required this.openMark,
      required this.closeMark,
      this.normalStyle,
      this.specialStyle});

  @override
  Widget build(BuildContext context) {
    TextFormatter formatter = TextFormatter(BoldBetweenMarksStrategy());
    return RichText(
      text: formatter.format(
          text, openMark, closeMark, normalStyle, specialStyle),
    );
  }
}
