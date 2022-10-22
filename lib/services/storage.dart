import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  //сохранение файла из кэша
  Future<void> saveFile(PlatformFile file) async {
    // final appStorage = await getApplicationDocumentsDirectory();
    final savedFile = File("${file.path}");

    try {
      await storage.ref('avatars/${file.name}').putFile(savedFile);
    } catch (e) {
      print(e);
    }
  }
}
