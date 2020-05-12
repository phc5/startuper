import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

import 'app_drawer.dart';

class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: primaryTextColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black12,
          ),
        ],
      ),
      child: ListView(
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}
