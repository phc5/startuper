import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class SettingsViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
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

  Future deleteUser(String password) async {
    await _authenticationService.deleteUser(password);
  }
}
