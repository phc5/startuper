import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:ideabuilder/app/locator.dart';

import 'package:ideabuilder/ui/views/settings/settings_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';

class AppShellViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final List<Widget> pages = [
    HomeView(
      key: PageStorageKey('HomeView'),
    ),
    SettingsView(
      key: PageStorageKey('SettingsView'),
    ),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  int currentViewIndex = 0;

  String get user => _authenticationService?.currentUser?.fullName;

  Future navigateToIndex(int index) async {
    currentViewIndex = index;
    notifyListeners();
  }
}
