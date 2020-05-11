import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';

class DrawerOptionViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateTo(String route) {
    _navigationService.navigateTo(route);
  }
}
