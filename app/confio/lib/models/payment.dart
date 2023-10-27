import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/models/overall_payment.dart';

class Payment {
  final double amount;
  final String currency;
  final Timestamp due;
  final String from;
  final String to;
  final DocumentSnapshot doc;
  final OverallPayment overallPayment;

  Payment._({
    required this.amount,
    required this.currency,
    required this.from,
    required this.to,
    required this.due,
    required this.doc,
    required this.overallPayment,
  });

  static List<Payment?> fromOverallPayment(OverallPayment? overallPayment) {
    List<Payment?> listOfPayments = [];
    if (overallPayment != null) {
      for (var i = 0; i < overallPayment.due.length; i++) {
        listOfPayments.add(
          Payment._(
            amount: overallPayment.amount,
            currency: overallPayment.currency,
            due: overallPayment.due[i],
            from: overallPayment.from,
            to: overallPayment.to,
            doc: overallPayment.doc,
            overallPayment: overallPayment,
          ),
        );
      }
    }
    return listOfPayments;
  }
}
