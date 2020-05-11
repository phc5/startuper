import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class DeleteAccountViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

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
      await _dialogService.showDialog(
        title: 'We\'re sorry to see you go!',
        description:
            'Your account has been successfully deleted.\n\n You will now be navigated to the login screen.\n\n If you need assistance or have any concerns, please do not hesitate to reach out to us.',
      );

      _navigationService.replaceWith(Routes.loginViewRoute);
    }
  }
}
