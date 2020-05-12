import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_viewmodel.dart';

class DrawerOptionTabletPortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String route;
  const DrawerOptionTabletPortrait(
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
                var isCurrentRoute = model.isCurrentRoute(route, context);

                if (!isCurrentRoute) {
                  model.navigateTo(route);
                }
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    iconData,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
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
