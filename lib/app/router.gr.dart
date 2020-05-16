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
import 'package:ideabuilder/ui/views/app_shell/app_shell_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/views/home/create_project/create_project_view.dart';
import 'package:ideabuilder/ui/views/reset_email/reset_email_view.dart';
import 'package:ideabuilder/ui/views/reset_password/reset_password_view.dart';
import 'package:ideabuilder/ui/views/delete_account/delete_account_view.dart';
import 'package:ideabuilder/ui/views/settings/settings_view.dart';
import 'package:ideabuilder/ui/views/settings/change_theme/change_theme_view.dart';

abstract class Routes {
  static const startupViewRoute = '/';
  static const signUpViewRoute = '/sign-up-view-route';
  static const loginViewRoute = '/login-view-route';
  static const appShellViewRoute = '/app-shell-view-route';
  static const homeViewRoute = '/home-view-route';
  static const createProjectViewRoute = '/create-project-view-route';
  static const resetEmailViewRoute = '/reset-email-view-route';
  static const resetPasswordViewRoute = '/reset-password-view-route';
  static const deleteAccountViewRoute = '/delete-account-view-route';
  static const settingsViewRoute = '/settings-view-route';
  static const changeThemeViewRoute = '/change-theme-view-route';
  static const all = {
    startupViewRoute,
    signUpViewRoute,
    loginViewRoute,
    appShellViewRoute,
    homeViewRoute,
    createProjectViewRoute,
    resetEmailViewRoute,
    resetPasswordViewRoute,
    deleteAccountViewRoute,
    settingsViewRoute,
    changeThemeViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
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
      case Routes.appShellViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AppShellView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(
              key: typedArgs.key,
              appShellViewModel: typedArgs.appShellViewModel),
          settings: settings,
        );
      case Routes.createProjectViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateProjectView(),
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
          builder: (context) => SettingsView(
              key: typedArgs.key,
              appShellViewModel: typedArgs.appShellViewModel),
          settings: settings,
        );
      case Routes.changeThemeViewRoute:
        if (hasInvalidArgs<ChangeThemeViewArguments>(args)) {
          return misTypedArgsRoute<ChangeThemeViewArguments>(args);
        }
        final typedArgs =
            args as ChangeThemeViewArguments ?? ChangeThemeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChangeThemeView(
              key: typedArgs.key,
              appShellViewModel: typedArgs.appShellViewModel),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  final AppShellViewModel appShellViewModel;
  HomeViewArguments({this.key, this.appShellViewModel});
}

//SettingsView arguments holder class
class SettingsViewArguments {
  final Key key;
  final AppShellViewModel appShellViewModel;
  SettingsViewArguments({this.key, this.appShellViewModel});
}

//ChangeThemeView arguments holder class
class ChangeThemeViewArguments {
  final Key key;
  final AppShellViewModel appShellViewModel;
  ChangeThemeViewArguments({this.key, this.appShellViewModel});
}
