import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:ideabuilder/app/locator.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String _title = 'Home View';
  String get title => '$_title\n Counter: $counter';

  int _counter = 0;
  int get counter => _counter;

  String get user => _authenticationService.currentUser.fullName;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }
}
