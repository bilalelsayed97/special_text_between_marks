import 'package:flutter/material.dart';
import 'package:special_text_between_marks/special_text_between_marks.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const myNormalStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
    const mySpecialStyle = TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline);
    return MaterialApp(
      title: "Special Text Between Marks",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpecialTextBetweenMarks(
                  text:
                      "This is the *Default* example with *multiple words* between marks.",
                  openMark: '*',
                  closeMark: '*',
                ),
                SpecialTextBetweenMarks(
                  text:
                      'This is the "Custom" example with "multiple words" between marks.',
                  openMark: '"',
                  closeMark: '"',
                  normalStyle: myNormalStyle,
                  specialStyle: mySpecialStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
