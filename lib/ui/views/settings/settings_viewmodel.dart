import 'package:ideabuilder/services/theme_manager.dart';
import 'package:ideabuilder/ui/shared/theme.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class SettingsViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String get user => _authenticationService?.currentUser?.fullName;

  void logout() {
    _authenticationService.logOut();
    _navigationService.replaceWith(Routes.loginViewRoute);
  }

  void changeEmail() {
    _navigationService.navigateTo(Routes.resetEmailViewRoute);
  }

  void changePassword() {
    _navigationService.navigateTo(Routes.resetPasswordViewRoute);
  }

  void deleteAccount() {
    _navigationService.navigateTo(Routes.deleteAccountViewRoute);
  }

  void changeTheme() {
    _navigationService.navigateTo(Routes.changeThemeViewRoute);
  }
}
