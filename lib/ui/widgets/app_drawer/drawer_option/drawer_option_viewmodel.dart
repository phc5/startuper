import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';

class DrawerOptionViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateTo(String route) {
    _navigationService.navigateTo(route);
  }

  bool isCurrentRoute(String route, BuildContext context) {
    bool isNewRouteSameAsCurrent = false;

    Navigator.popUntil(context, (routeParam) {
      if (routeParam.settings.name == route) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    return isNewRouteSameAsCurrent;
  }
}
