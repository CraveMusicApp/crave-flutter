import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User> get currentUser => _auth.authStateChanges();

  Future getCurrentUser() async {
    return _auth.currentUser;
  }

  getProfileImage() {
    if (_auth.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  getDisplayName() {
    var displayName = _auth.currentUser.displayName;
    debugPrint('username $displayName');
    return displayName;
  }
}
