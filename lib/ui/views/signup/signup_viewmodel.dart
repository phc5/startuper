import 'package:flutter/foundation.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      fullName: fullName,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.homeViewRoute);
      } else {
        _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General Sign Up failure. Please try again later.',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
