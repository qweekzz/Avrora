import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  Stream<User?> get currentUser{
    return FirebaseAuth.instance.authStateChanges();
  }


}