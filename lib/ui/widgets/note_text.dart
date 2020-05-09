import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class NoteText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  const NoteText(this.text, {this.textAlign, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
    );
  }
}
