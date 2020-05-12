import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_viewmodel.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';

class DrawerOptionDesktop extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String route;
  const DrawerOptionDesktop({Key key, this.iconData, this.route, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return ViewModelBuilder<DrawerOptionViewModel>.nonReactive(
      viewModelBuilder: () => DrawerOptionViewModel(),
      builder: (context, model, child) => Container(
        height: 60,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                var isCurrentRoute = model.isCurrentRoute(route, context);

                if (!isCurrentRoute) {
                  model.navigateTo(route);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
