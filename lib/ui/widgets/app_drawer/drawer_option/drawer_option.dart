import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/responsive/orientation_layout.dart';
import 'package:ideabuilder/ui/shared/responsive/screen_type_layout.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_desktop.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_mobile.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String route;

  const DrawerOption({
    Key key,
    this.title,
    this.iconData,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        landscape: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
          route: route,
        ),
        portrait: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
          route: route,
        ),
      ),
      tablet: OrientationLayout(
        landscape: DrawerOptionTabletPortrait(
          title: title,
          iconData: iconData,
          route: route,
        ),
        portrait: DrawerOptionTabletPortrait(
          title: title,
          iconData: iconData,
          route: route,
        ),
      ),
      desktop: DrawerOptionDesktop(
        title: title,
        iconData: iconData,
        route: route,
      ),
    );
  }
}
