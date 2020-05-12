import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

import 'app_drawer.dart';

class AppDrawerDesktop extends StatelessWidget {
  const AppDrawerDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      width: 225,
      decoration: BoxDecoration(
        color: primaryTextColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: orientation == Orientation.portrait
            ? Row(children: AppDrawer.getDrawerOptions())
            : Column(children: AppDrawer.getDrawerOptions()),
      ),
    );
  }
}
