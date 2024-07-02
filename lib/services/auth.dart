import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final authService = FirebaseAuth.instance;
  Future<void> login(String email, String password) async {
    try {
      await authService.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await authService.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    authService.signOut();
  }
}
