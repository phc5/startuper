import 'package:auto_route/auto_route_annotations.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_view.dart';
import 'package:ideabuilder/ui/views/delete_account/delete_account_view.dart';
import 'package:ideabuilder/ui/views/login/login_view.dart';
import 'package:ideabuilder/ui/views/reset_email/reset_email_view.dart';
import 'package:ideabuilder/ui/views/reset_password/reset_password_view.dart';
import 'package:ideabuilder/ui/views/settings/change_theme/change_theme_view.dart';
import 'package:ideabuilder/ui/views/settings/settings_view.dart';
import 'package:ideabuilder/ui/views/signup/signup_view.dart';
import 'package:ideabuilder/ui/views/startup/startup_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';

// auto_route package allows you to define your routes and then generates the code to handle routing
@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  SignUpView signUpViewRoute;
  LoginView loginViewRoute;
  AppShellView appShellViewRoute;
  HomeView homeViewRoute;
  ResetEmailView resetEmailViewRoute;
  ResetPasswordView resetPasswordViewRoute;
  DeleteAccountView deleteAccountViewRoute;
  SettingsView settingsViewRoute;
  ChangeThemeView changeThemeViewRoute;
}
