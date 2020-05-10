import 'package:flutter/foundation.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  /// Authenticates a user. If success, navigates to homeView, else shows an Error Dialog.
  ///
  /// @param {String} email     - User's email
  /// @param {String} password  - User's password
  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.appShellViewRoute);
      } else {
        _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General Login failure. Please try again later.',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  /// Sends user to sign up view
  Future navigateToSignUp() async {
    await _navigationService.replaceWith(Routes.signUpViewRoute);
  }

  Future navigateToResetPassword() async {
    await _navigationService.navigateTo(Routes.resetPasswordViewRoute);
  }
}
