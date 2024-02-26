// Strategy interface
import 'package:flutter/material.dart';

abstract class TextStrategy {
  TextSpan format(String text, String openMark, String closeMark,
      TextStyle? normalStyle, TextStyle? specialStyle);
}

// Concrete strategy for bolding text between specified marks
class BoldBetweenMarksStrategy implements TextStrategy {
  @override
  TextSpan format(String text, String openMark, String closeMark,
      TextStyle? normalStyle, TextStyle? specialStyle) {
    List<TextSpan> textSpans = [];

    String escapedOpenMark = RegExp.escape(openMark);
    String escapedCloseMark = RegExp.escape(closeMark);

    String pattern = '$escapedOpenMark(.*?)$escapedCloseMark';
    RegExp exp = RegExp(pattern);

    Iterable<RegExpMatch> matches = exp.allMatches(text);

    int lastIndex = 0;

    for (RegExpMatch match in matches) {
      // Add the text before the match
      if (match.start > lastIndex) {
        textSpans.add(
          TextSpan(
              text: text.substring(lastIndex, match.start),
              style: normalStyle ?? const TextStyle(color: Colors.black)),
        );
      }

      // Add the bolded text without marks
      textSpans.add(
        TextSpan(
          text: match.group(1), // Extract text without marks
          style: specialStyle ??
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );

      // Update the last index
      lastIndex = match.end;
    }

    // Add the remaining text after the last match
    if (lastIndex < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: normalStyle ?? const TextStyle(color: Colors.black),
        ),
      );
    }

    return TextSpan(children: textSpans);
  }
}
