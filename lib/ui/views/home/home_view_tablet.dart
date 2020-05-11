import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer.dart';

class HomeTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer(),
    ];

    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(children: children)
          : Row(children: children.reversed.toList()),
    );
  }
}
