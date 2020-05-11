import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/responsive/orientation_layout.dart';
import 'package:ideabuilder/ui/shared/responsive/screen_type_layout.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer_tablet.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/drawer_option/drawer_option.dart';
import 'package:ideabuilder/app/router.gr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Home',
        iconData: Icons.home,
        route: Routes.homeViewRoute,
      ),
      DrawerOption(
        title: 'Reports',
        iconData: Icons.photo_filter,
        route: Routes.resetPasswordViewRoute,
      ),
      DrawerOption(
        title: 'Incidents',
        iconData: Icons.message,
        route: Routes.resetEmailViewRoute,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
        route: Routes.settingsViewRoute,
      )
    ];
  }
}
