import 'package:cloud_firestore/cloud_firestore.dart';

class OverallPayment {
  final double amount;
  final String currency;
  final List<Timestamp> due;
  final String from;
  final String to;
  final DocumentSnapshot doc;

  OverallPayment._({
    required this.amount,
    required this.currency,
    required this.from,
    required this.to,
    required this.due,
    required this.doc,
  });

  static OverallPayment? fromDocument(DocumentSnapshot doc) {
    return OverallPayment._(
      amount: doc["amount"].toDouble(),
      currency: doc["currency"],
      due: doc["due"].map<Timestamp>((e) => e as Timestamp).toList(),
      from: doc["from"],
      to: doc["to"],
      doc: doc,
    );
  }
}
