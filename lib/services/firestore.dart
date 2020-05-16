import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideabuilder/models/project.dart';
import 'package:ideabuilder/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _projectsCollectionReference =
      Firestore.instance.collection('projects');
  final StreamController<List<Project>> _projectStreamController =
      StreamController<List<Project>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();

      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Future updateUserEmail(String uid, String email) async {
    try {
      _usersCollectionReference.document(uid).updateData({"email": email});
    } catch (e) {
      return e.message;
    }
  }

  Future deleteUser(String uid) async {
    try {
      await _usersCollectionReference.document(uid).delete();
    } catch (e) {
      return e.message;
    }
  }

  /// PROJECTS
  Future addProject(Project project) async {
    try {
      await _projectsCollectionReference.add(project.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getProjectsOnceOff(User user) async {
    try {
      var projectsDocumentSnapshot = await _projectsCollectionReference
          .orderBy('timestamp', descending: true)
          .getDocuments();
      if (projectsDocumentSnapshot.documents.isNotEmpty) {
        return projectsDocumentSnapshot.documents
            .map((snapshot) => Project.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.userId == user.id)
            .toList();
      }
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToProjectsRealTime(User user) {
    //Register handler for when the projects data changes.
    _projectsCollectionReference
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((projectSnapshot) {
      if (projectSnapshot.documents.isNotEmpty) {
        var projects = projectSnapshot.documents
            .map((snapshot) => Project.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.userId == user.id)
            .toList();
        _projectStreamController.add(projects);
      }
    });

    return _projectStreamController.stream;
  }
}
