import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/models/overall_payment.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';

enum Recurrences { weekly, monthly, yearly }

class FirebaseService {
  // singleton instance
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocument(
      String uid) async {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  // generate timestamps for a payment to be created
  List<Timestamp> generateTimestampList(
      Recurrences recurrence, Timestamp endDate, List<int> inputs) {
    List<Timestamp> timestampList = [];
    DateTime now = DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 0, 0, 0, 0);

    switch (recurrence) {
      case Recurrences.weekly:
        while (now.isBefore(endDate.toDate())) {
          if (inputs.contains(now.weekday)) {
            // weekday is 1 through 7
            timestampList.add(Timestamp.fromDate(now));
          }

          now.add(const Duration(days: 1));
        }

        break;
      case Recurrences.monthly:
        while (now.isBefore(endDate.toDate())) {
          if (inputs.contains(now.day)) {
            timestampList.add(Timestamp.fromDate(now));
          }

          now.add(const Duration(days: 1));
        }
        break;
      case Recurrences.yearly:
        // same as weekly and monthly but now we do one payment at the start
        // of each month in inputs until the endDate
        while (now.isBefore(endDate.toDate())) {
          if (inputs.contains(now.month)) {
            timestampList.add(Timestamp.fromDate(now));
          }

          now = DateTime(now.year, now.month + 1, 1);
        }
        break;
      default:
        timestampList.add(endDate);
        break;
    }

    return timestampList;
  }

  /*
  *
  * CRUD Payments
  *
  */
  Future<String?> addPayment(double amount, String currency,
      List<Timestamp> due, String uidFrom, String uidTo) async {
    try {
      final data = {
        "amount": amount,
        "currency": currency,
        "due": due,
        "from": uidFrom,
        "to": uidTo,
      };

      await _firestore.collection("payments").add(data);

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<Map<String, dynamic>?> getPayment(String paymentID) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("payments").doc(paymentID).get();

      final data = doc.data() as Map<String, dynamic>;
      return data;
    } on FirebaseException {
      return null;
    }
  }

  Future<List<OverallPayment>?> getPaymentsByUid(String uid) async {
    try {
      final List<OverallPayment> listOfMaps = [];

      QuerySnapshot querySnapshot = await _firestore
          .collection("payments")
          .where(Filter.or(
              Filter("from", isEqualTo: uid), Filter("to", isEqualTo: uid)))
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        listOfMaps.add(OverallPayment.fromDocument(docSnapshot)!);
      }

      return listOfMaps;
    } on FirebaseException catch (e) {
      Get.snackbar("Error al cargar los pagos", e.message!);
      return null;
    }
  }

  Future<List<OverallPayment>?> getPaymentsFromTo(
      String from, String to) async {
    try {
      final List<OverallPayment> listOfMaps = [];

      QuerySnapshot querySnapshot = await _firestore
          .collection("payments")
          .where("from", isEqualTo: from)
          .where("to", isEqualTo: to)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        listOfMaps.add(OverallPayment.fromDocument(docSnapshot)!);
      }

      return listOfMaps;
    } on FirebaseException catch (e) {
      Get.snackbar("Error al cargar los pagos", e.message!);
      return null;
    }
  }

  Future<String?> updatePayment(
      {required String paymentID,
      Float? amount,
      String? currency,
      List<Timestamp>? due,
      String? uidFrom,
      String? uidTo}) async {
    try {
      Map<String, dynamic> data = {
        "amount": amount,
        "currency": currency,
        "due": due,
        "from": uidFrom,
        "to": uidTo,
      };

      data.removeWhere((key, value) => value == null);

      await _firestore.collection("payments").doc(paymentID).update(data);

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> deletePayment(String paymentID) async {
    try {
      await _firestore.collection("payments").doc(paymentID).delete();

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<void> uploadToken(String? token) async {
    if ((await _firebaseMessaging.requestPermission()).authorizationStatus ==
        AuthorizationStatus.authorized) {
      token = await _firebaseMessaging.getToken();
    }
    return await _firestore
        .collection("users")
        .doc(authenticationService.currentUser!.uid)
        .update({
      "token": FieldValue.arrayUnion([token]),
    });
  }

  Future<void> deleteToken(String? token) {
    if (token != null) {
      return _firestore
          .collection("users")
          .doc(authenticationService.currentUser!.uid)
          .update({
        "token": FieldValue.arrayRemove([token]),
      });
    } else {
      return Future<void>.value();
    }
  }

  /*
	** CRUD Users
	*/
  Future<String?> addUser(String uid, String email) async {
    try {
      final data = {
        "email": email,
      };

      await _firestore.collection("users").doc(uid).set(data);

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<Map<String, dynamic>?> getUserByUid(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();

      final data = doc.data() as Map<String, dynamic>;

      return data;
    } on FirebaseException {
      return null;
    }
  }

  Future<String?> updateUser(
      {required String uid, String? email, List<String>? token}) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "token": token,
      };

      data.removeWhere((key, value) => value == null);

      await _firestore.collection("users").doc(uid).update(data);

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> deleteUser(String uid) async {
    try {
      await _firestore.collection("users").doc(uid).delete();

      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}

final firebaseService = FirebaseService.instance;
