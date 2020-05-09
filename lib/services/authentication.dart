import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/services/firestore.dart';
import 'package:ideabuilder/models/user.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/app/router.gr.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //create a new user profile on Firestore
      _currentUser = User(
        id: authResult.user.uid,
        email: email,
        fullName: fullName,
      );
      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      try {
        _currentUser = await _firestoreService.getUser(user.uid);
      } catch (e) {
        return e.message;
      }
    }
  }

  Future resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }

  void logOut() async {
    try {
      await _firebaseAuth.signOut();
      _currentUser = null;
    } catch (e) {
      return e.message;
    }
  }

  Future reauthenticate(String password) async {
    try {
      var user = await _firebaseAuth.currentUser();
      _firestoreService.deleteUser(user.uid);
      var credential = EmailAuthProvider.getCredential(
          email: user.email, password: password);
      return user.reauthenticateWithCredential(credential);
    } catch (e) {
      return e.message;
    }
  }

  Future deleteUser(String password) async {
    try {
      var user = await _firebaseAuth.currentUser();
      var authenicated = await reauthenticate(password);

      if (authenicated is AuthResult) {
        _firestoreService.deleteUser(user.uid);
        user.delete();
        _navigationService.replaceWith(Routes.loginViewRoute);
      }
    } catch (e) {
      return e.message;
    }
  }
}
