import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:ideabuilder/services/firestore.dart';

// use `flutter packages pub run build_runner build` to build locator file
// use `flutter packages pub run build_runner clean` to clear out cache
@registerModule
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  FirestoreService get firestoreService;
}
