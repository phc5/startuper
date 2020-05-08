import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

import 'package:ideabuilder/ui/views/settings/settings_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';

class AppShellViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final List<Widget> pages = [HomeView(), SettingsView()];

  int currentViewIndex = 0;

  String get user => _authenticationService?.currentUser?.fullName;

  Future navigateToIndex(int index) async {
    currentViewIndex = index;
    notifyListeners();
  }
}
