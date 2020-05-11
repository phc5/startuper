import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';

class ResetEmailViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future changeEmail(String newEmail, String password, context) async {
    setBusy(true);
    var error = await _authenticationService.changeEmail(newEmail, password);
    setBusy(false);

    if (error != null) {
      await _dialogService.showDialog(
        title: 'Change Email Failure',
        description: error,
      );
    } else {
      Navigator.of(context).pop();
      await _dialogService.showDialog(
        title: 'Change Email Success!',
        description: 'You may now use your new email to login to this account.',
      );
      Navigator.of(context).pop();
    }
  }
}
