import 'package:cloud_firestore/cloud_firestore.dart';

class ConfioUser {
  final String? id;
  final String? email;
  final List<String?> payers;
  final List<String?> payees;
  final DocumentSnapshot? doc;

  ConfioUser._({
    required this.id,
    required this.email,
    required this.payers,
    required this.payees,
    required this.doc,
  });

  factory ConfioUser.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ConfioUser._(
      payers: (data['payers'] as List<dynamic>)
          .map<String?>((c) => c.toString())
          .toList(),
      payees: (data['payees'] as List<dynamic>)
          .map<String?>((c) => c.toString())
          .toList(),     
      id: doc.id,
      email: data['email'] as String?,
      doc: doc,
    );
  }
}
