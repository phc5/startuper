import 'package:flutter/cupertino.dart';
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
        width: 152,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconData,
              size: 45,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
