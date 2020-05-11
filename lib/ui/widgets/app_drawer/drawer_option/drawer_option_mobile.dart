import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/app/router.gr.dart';
import 'package:ideabuilder/ui/views/settings/settings_view.dart';

class DrawerOptionMobilePortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOptionMobilePortrait({Key key, this.title, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      height: 80,
      child: Row(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Route route =
                  MaterialPageRoute(builder: (context) => SettingsView());
              Navigator.push(context, route);
            },
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 25,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 21),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerOptionMobileLandscape extends StatelessWidget {
  final IconData iconData;
  const DrawerOptionMobileLandscape({Key key, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Icon(iconData),
        ],
      ),
    );
  }
}
