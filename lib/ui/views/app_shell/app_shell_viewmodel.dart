import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/ui/views/settings/settings_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';

class AppShellViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final List<String> pages = [
    'Home',
    'Settings',
  ];

  final List<Widget> pageViews = [
    HomeView(
      key: PageStorageKey('HomeView'),
    ),
    SettingsView(
      key: PageStorageKey('SettingsView'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int currentViewIndex = 0;
  String currentView = 'Home';
  bool menuCollapsed = true;
  double screenHeight = 0;
  double screenWidth = 0;

  String get user => _authenticationService?.currentUser?.fullName;

  void toggleMenu() async {
    menuCollapsed = !menuCollapsed;
    notifyListeners();
  }

  Future navigateToIndex(int index) async {
    currentViewIndex = index;
    currentView = pages[currentViewIndex];
    menuCollapsed = true;
    notifyListeners();
  }
}
