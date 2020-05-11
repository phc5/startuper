import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_viewmodel.dart';

class DrawerOptionMobilePortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String route;
  const DrawerOptionMobilePortrait(
      {Key key, this.title, this.iconData, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerOptionViewModel>.nonReactive(
      viewModelBuilder: () => DrawerOptionViewModel(),
      builder: (context, model, child) => Container(
        padding: EdgeInsets.only(left: 25),
        height: 80,
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context); // pop the
                model.navigateTo(route);
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
      ),
    );
  }
}

class DrawerOptionMobileLandscape extends StatelessWidget {
  final IconData iconData;
  final String route;
  const DrawerOptionMobileLandscape({Key key, this.iconData, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerOptionViewModel>.nonReactive(
      viewModelBuilder: () => DrawerOptionViewModel(),
      builder: (context, model, child) => Container(
        height: 70,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
