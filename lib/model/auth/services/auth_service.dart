import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailandPassword(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //add new doc for user in users collection
      // _firestore.collection('users').doc(userCredential.user!.uid).set(
      //     {"uid": userCredential.user!.uid, email: email, password: password,username:username});
      // SetOptions(merge: true);
      // return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<void> signUpWithEmailPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //after user is created
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'password': password,
        'username': username,
      });
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//   void saveUsernameToDatabase(String uid, String username) {
//   FirebaseFirestore.instance.collection('users').doc(uid).set({
//     'username': username,
//     // Add other user data if needed
//   });
// }
}
