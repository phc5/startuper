import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class SettingsButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final Color textColor;

  const SettingsButton({
    @required this.title,
    @required this.onPressed,
    this.color = Colors.white,
    this.textColor = primaryBackgroundColor,
  });

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              widget.title,
              style: buttonTitleTextStyle,
            )),
      ),
    );
  }
}
