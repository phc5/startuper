import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class SettingsViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final settingsPageIndex = 2;

  String _title = 'Settings View';
  String get title => '$_title\n Counter: $counter';

  int _counter = 0;
  int get counter => _counter;

  String get user => _authenticationService?.currentUser?.fullName;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  void logout() {
    _authenticationService.logOut();
    _navigationService.navigateTo(Routes.loginViewRoute);
  }

  Future changePassword(String email, context) async {
    setBusy(true);
    var error = await _authenticationService.resetPassword(email);

    setBusy(false);

    if (error != null) {
      await _dialogService.showDialog(
        title: 'Reset Password Failure',
        description: error,
      );
    } else {
      Navigator.of(context).pop();
      await _dialogService.showDialog(
        title: 'Password Reset Email Sent!',
        description:
            'Please follow the instructions in the email to complete your password reset.',
      );
      Navigator.of(context).pop();
    }
  }

  Future deleteUser(String password) async {
    setBusy(true);
    var result = await _authenticationService.deleteUser(password);
    setBusy(false);

    if (result is String) {
      _dialogService.showDialog(
        title: 'Account Deletion Failure',
        description:
            '$result\n\n If you\'re having trouble deleting your account, please contact us to delete your account.',
      );
    } else {
      _navigationService.replaceWith(Routes.loginViewRoute);
    }
  }

  Future<void> showChangePassword(context, model) async {
    final emailController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'To change your password, enter your email below. An email will be sent that incldues a link to change your password.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BusyButton(
              title: 'Confirm',
              color: Colors.redAccent,
              textColor: Colors.white,
              busy: model.isBusy,
              onPressed: () {
                model.changePassword(emailController.text, context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteAccountDialog(context, model) async {
    final passwordController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Deactivation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'When you deactivate your account, you will be logged out and this account will no longer be usable.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Please enter your password to confirm.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BusyButton(
              title: 'Confirm',
              color: Colors.redAccent,
              textColor: Colors.white,
              busy: model.isBusy,
              onPressed: () {
                model.deleteUser(passwordController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
