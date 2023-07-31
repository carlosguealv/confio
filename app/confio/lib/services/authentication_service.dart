import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // Singleton instance
  AuthenticationService._();
  static final AuthenticationService instance = AuthenticationService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }

  bool isUserLoggedIn() {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

  bool isUserVerified() {
    var user = _firebaseAuth.currentUser;
    return user != null && user.emailVerified;
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> sendEmailForVerificationToCurrentUser() async {
    await _firebaseAuth.currentUser.sendEmailVerification();
  }

  Future deleteCurrentUserAccount(bool hasImage) async {
    await _firebaseAuth.currentUser?.delete();
  }
}

final authenticationService = AuthenticationService.instance;
