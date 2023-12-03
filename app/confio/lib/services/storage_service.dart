import 'dart:io';

import 'package:confio/models/confio_user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/route_manager.dart';

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  Future<void> uploadProfilePicture(ConfioUser user, File file) async {
    try {
      await FirebaseStorage.instance
          .ref()
          .child('images/${user.email}.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      GetSnackBar(
        title: "Error",
        message: e.message,
      );
    }
  }
}

final storageService = StorageService.instance;
