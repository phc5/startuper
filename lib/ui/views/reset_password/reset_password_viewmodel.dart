import 'package:flutter/foundation.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future resetPassword({
    @required String email,
  }) async {
    setBusy(true);

    var error = await _authenticationService.resetPassword(email);

    setBusy(false);

    if (error != null) {
      await _dialogService.showDialog(
        title: 'Reset Password Failure',
        description: error,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Password Reset Email Sent!',
        description:
            'Please follow the instructions in the email to complete your password reset.',
      );
      _navigationService.replaceWith(Routes.loginViewRoute);
    }
  }
}
