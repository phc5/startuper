import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/services/firestore.dart';
import 'package:ideabuilder/models/user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

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
    try {
      await _populateCurrentUser(user);
    } catch (e) {
      return e;
    }

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

  Future changeEmail(String newEmail, String password) async {
    try {
      var user = await _firebaseAuth.currentUser();

      if (user != null) {
        var credential = EmailAuthProvider.getCredential(
            email: user.email, password: password);
        await user
            .reauthenticateWithCredential(credential)
            .catchError((e) => throw (e));

        await _firestoreService
            .updateUserEmail(user.uid, newEmail)
            .catchError((e) => throw (e));

        await user.updateEmail(newEmail).catchError((e) => throw (e));
      }
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

  Future deleteUser(String password) async {
    try {
      var user = await _firebaseAuth.currentUser();

      if (user != null) {
        var credential = EmailAuthProvider.getCredential(
            email: user.email, password: password);
        await user
            .reauthenticateWithCredential(credential)
            .catchError((e) => throw (e));

        await _firestoreService
            .deleteUser(user.uid)
            .catchError((e) => throw (e));

        await user.delete().catchError((e) => throw (e));
      }
    } catch (e) {
      return e.message;
    }
  }
}
