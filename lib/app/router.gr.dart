// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ideabuilder/ui/views/startup/startup_view.dart';
import 'package:ideabuilder/ui/views/signup/signup_view.dart';
import 'package:ideabuilder/ui/views/login/login_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';
import 'package:ideabuilder/ui/views/reset_email/reset_email_view.dart';
import 'package:ideabuilder/ui/views/reset_password/reset_password_view.dart';
import 'package:ideabuilder/ui/views/delete_account/delete_account_view.dart';
import 'package:ideabuilder/ui/views/settings/settings_view.dart';

abstract class Routes {
  static const startupViewRoute = '/';
  static const signUpViewRoute = '/sign-up-view-route';
  static const loginViewRoute = '/login-view-route';
  static const homeViewRoute = '/home-view-route';
  static const resetEmailViewRoute = '/reset-email-view-route';
  static const resetPasswordViewRoute = '/reset-password-view-route';
  static const deleteAccountViewRoute = '/delete-account-view-route';
  static const settingsViewRoute = '/settings-view-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartupView(),
          settings: settings,
        );
      case Routes.signUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.resetEmailViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResetEmailView(),
          settings: settings,
        );
      case Routes.resetPasswordViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResetPasswordView(),
          settings: settings,
        );
      case Routes.deleteAccountViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => DeleteAccountView(),
          settings: settings,
        );
      case Routes.settingsViewRoute:
        if (hasInvalidArgs<SettingsViewArguments>(args)) {
          return misTypedArgsRoute<SettingsViewArguments>(args);
        }
        final typedArgs =
            args as SettingsViewArguments ?? SettingsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

//SettingsView arguments holder class
class SettingsViewArguments {
  final Key key;
  SettingsViewArguments({this.key});
}
