import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
 final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) => 
  _auth.signInWithCredential(credential);
  Future<String> logout() => _auth.signOut();
  Stream<User> get currentUser => _auth.authStateChanges();

Future<String> awaitSignOut() async {
  try {
    var result = await logout();
    return '$result You are signed Out';
  } catch (e) {
    return 'Failed to logout user: $e';
  }
}
}