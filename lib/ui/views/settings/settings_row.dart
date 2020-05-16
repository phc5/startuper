import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final Function action;
  final Color _color;
  const SettingsRow(
    this.title,
    this.action, {
    Key key,
    Color color,
  })  : _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action();
      },
      child: SizedBox(
        height: 50,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                    color: _color,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: _color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
