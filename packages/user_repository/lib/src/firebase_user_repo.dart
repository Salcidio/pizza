import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_repository/src/entities/user_entity.dart';
import 'package:pizza_repository/src/models/user.dart';
import 'package:pizza_repository/src/user_repo.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUserRepo extends UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((fireBaseUser) async* {
      if (fireBaseUser == null) {
        yield null;
      } else {
        /*
        yield await usersCollection.doc(fireBaseUser.uid).get().then(
            (value) => MyUser.fromEntity(MyUserEntity.fromJson(value.data()!)));
     */ }
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString() as num);
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myuser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myuser.email, password: password);

      myuser.userID = user.user!.uid;
      return myuser;
    } catch (e) {
      log(e.toString() as num);
      rethrow;
    }
  }

  @override
  Future<void> SetUserData(MyUser user) {
    // TODO: implement SetUserData
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
