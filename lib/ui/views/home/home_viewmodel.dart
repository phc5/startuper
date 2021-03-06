import 'package:flutter/material.dart';
import 'package:ideabuilder/models/project.dart';
import 'package:ideabuilder/models/user.dart';
import 'package:ideabuilder/services/firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/services/authentication.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/app/router.gr.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _fireStoreService = locator<FirestoreService>();

  User get currentUser => _authenticationService?.currentUser;

  List<Project> _projects;
  List<Project> get projects => _projects;

  void logout() {
    _authenticationService.logOut();
    _navigationService.navigateTo(Routes.loginViewRoute);
  }

  void createProject() {
    _navigationService.navigateTo(Routes.createProjectViewRoute);
  }

  void listenToProjects() {
    setBusy(true);
    _fireStoreService
        .listenToProjectsRealTime(currentUser)
        .listen((projectsData) {
      List<Project> updatedProjects = projectsData;
      if (updatedProjects != null && updatedProjects.length > 0) {
        _projects = updatedProjects;
        notifyListeners();
      }
      setBusy(false);
    });
  }
}
