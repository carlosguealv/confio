import 'dart:io';

import 'package:confio/models/confio_user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  Future<void> uploadProfilePicture(ConfioUser user, Uint8List image) async {
    try {
      await FirebaseStorage.instance
          .ref()
          .child('images/${user.email}')
          .putData(image);
    } on FirebaseException catch (e) {
      GetSnackBar(
        title: "Error",
        message: e.message,
      );
    }
  }

  Future<Uint8List?> getProfilePic(ConfioUser user) async {
    const oneMegabyte = 1024 * 1024;
    try {
      final Uint8List? data = await FirebaseStorage.instance
          .ref()
          .child('images/${user.email}')
          .getData(oneMegabyte);

      return data;
    } on FirebaseException catch (e) {
      GetSnackBar(
        title: "Error",
        message: e.message,
      );
    }
  }
}

final storageService = StorageService.instance;
