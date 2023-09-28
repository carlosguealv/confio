import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // singleton instance
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
  *
  * CRUD Payments
  *
  */
  Future<String?> addPayment(Float amount, String currency, DateTime due,
      String uidFrom, String uidTo) async {
    try {
      final data = {
        "amount": amount,
        "currency": currency,
        "due": Timestamp.fromDate(due),
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
      await _firestore
          .collection("payments")
          .doc(paymentID)
          .get()
          .then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        return data;
      });
    } on FirebaseException {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getPaymentsByUid(String uid) async {
    try {
      List listOfMaps = [];

      await _firestore
          .collection("payments")
          .where("uid", isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          listOfMaps.add(docSnapshot.data() as Map<String, dynamic>);
        }

        return listOfMaps;
      });
    } on FirebaseException {
      return null;
    }
  }

  Future<String?> updatePayment(
      {required String paymentID,
      Float? amount,
      String? currency,
      DateTime? due,
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
}

final firebaseService = FirebaseService.instance;
