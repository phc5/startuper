import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  final String title;
  const SettingsHeader(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
