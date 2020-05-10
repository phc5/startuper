import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future handleStartUp() async {
    var isUserLoggedIn = await _authenticationService.isUserLoggedIn();

    if (isUserLoggedIn is bool && isUserLoggedIn) {
      _navigationService.replaceWith(Routes.appShellViewRoute);
    } else {
      _navigationService.replaceWith(Routes.loginViewRoute);
    }
  }
}
