import 'package:cloud_firestore/cloud_firestore.dart';

class ConfioUser {
  final String? id;
  final String? email;
  final List<String?> contacts;
  final DocumentSnapshot? doc;

  ConfioUser._({
    required this.id,
    required this.email,
    required this.contacts,
    required this.doc,
  });

  factory ConfioUser.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ConfioUser._(
      contacts: (data['contacts'] as List<dynamic>)
          .map<String?>((c) => c.toString())
          .toList(),
      id: doc.id,
      email: data['email'] as String?,
      doc: doc,
    );
  }
}
