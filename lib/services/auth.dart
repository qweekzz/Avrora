import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';

class AuthServices {
  Stream<User?> get currentUser {
    return FirebaseAuth.instance.authStateChanges();
  }
}
