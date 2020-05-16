import 'package:flutter/material.dart';
import 'package:ideabuilder/models/project.dart';
import 'package:ideabuilder/models/user.dart';
import 'package:ideabuilder/services/firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';

class CreateProjectViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _fireStoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  User get currentUser => _authenticationService?.currentUser;

  Future addProject({
    @required String name,
    @required String description,
  }) async {
    setBusy(true);
    var result = await _fireStoreService.addProject(
      Project(
        name: name,
        description: description,
        userId: currentUser.id,
        timestamp: DateTime.now().toUtc().millisecondsSinceEpoch,
      ),
    );
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Could not create project',
        description: result,
      );
    } else {
      _navigationService.popRepeated(1);
    }
  }
}
