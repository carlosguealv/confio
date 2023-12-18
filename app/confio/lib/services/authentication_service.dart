import 'package:confio/models/confio_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_service.dart';

class AuthenticationService {
  // Singleton instance
  AuthenticationService._();
  static final AuthenticationService instance = AuthenticationService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<ConfioUser?> get currentConfioUser async =>
      _firebaseAuth.currentUser != null
          ? ConfioUser.fromDocument(await firebaseService
              .getUserDocument(_firebaseAuth.currentUser!.uid))
          : null;

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      String? token;

      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, get the FCM token
      if ((await firebaseMessaging.requestPermission()).authorizationStatus ==
          AuthorizationStatus.authorized) {
        token = await firebaseMessaging.getToken();
      }

      return userCredential.user != null
          ? await () async {
              await firebaseService.uploadToken(token);
              return null;
            }()
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
      String? token;
      // After successful sign-up, get the FCM token
      if ((await firebaseMessaging.requestPermission()).authorizationStatus ==
          AuthorizationStatus.authorized) {
        token = await firebaseMessaging.getToken();
      }

      return authResult.user != null
          ? await () async {
              await firebaseService.addUser(authResult.user!.uid, email);
              await firebaseService.uploadToken(token);
              return null;
            }()
          : "Sign up failed. Please try again";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOutUser() async {
    // Delete FCM token before signing out
    await firebaseService.deleteToken(await firebaseMessaging.getToken());
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

  Future<void> createAndUploadToken() async {
    String? token = await firebaseMessaging.getToken();

    if (token != null) {
      await firebaseService.uploadToken(token);
    }
  }
}

final authenticationService = AuthenticationService.instance;
