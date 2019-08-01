import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final String questionText;
  final int maxLines;
  final double textSize;

  CenterText(this.questionText, {this.maxLines = 3, this.textSize = 28});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Center(
        child: AutoSizeText(
          questionText,
          style: TextStyle(fontSize: textSize),
          textAlign: TextAlign.center,
          maxLines: maxLines
        ),
      ),
    );
  }
}
