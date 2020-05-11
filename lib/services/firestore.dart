import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideabuilder/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

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
}
