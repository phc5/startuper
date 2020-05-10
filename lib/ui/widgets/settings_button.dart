import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class SettingsButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final bool isDelete;

  const SettingsButton({
    @required this.title,
    @required this.onPressed,
    this.color = Colors.white,
    this.textColor,
    this.isDelete = false,
  });

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: InkWell(
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: widget.color,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.textColor != null
                      ? widget.textColor
                      : Color.fromRGBO(66, 66, 66, 1.0),
                ),
              )),
        ),
      ),
    );
  }
}
