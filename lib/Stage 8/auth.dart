// flutterfire: is like bridge between flutter app and firebase
// firebase project it it like my backend server on cloud

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth
    }
  }
 }
