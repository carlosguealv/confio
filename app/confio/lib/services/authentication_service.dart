import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class AuthenticationService {
  // Singleton instance
  AuthenticationService._();
  static final AuthenticationService instance = AuthenticationService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  User? get currentUser => _firebaseAuth.currentUser;

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, get the FCM token
      String? token = await _firebaseMessaging.getToken();
      // TODO: Send this token to our backend or save it in a database

      return userCredential.user != null
          ? null
          : "Login failed. Please try again";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful sign-up, get the FCM token
      String? token = await _firebaseMessaging.getToken();
      // TODO: Send this token to your backend or save it in a database


      return authResult.user != null
          ? null
          : "Sign up failed. Please try again";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOutUser() async {
    // Delete FCM token before signing out
    await _firebaseMessaging.deleteToken();

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
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  Future<void> deleteCurrentUserAccount(bool hasImage) async {
    await _firebaseAuth.currentUser?.delete();
  }
}

final authenticationService = AuthenticationService.instance;
