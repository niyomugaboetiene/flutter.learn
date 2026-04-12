// flutterfire: is like bridge between flutter app and firebase
// firebase project it it like my backend server on cloud

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } catch (err) {
      print("Sign up error $err");
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } catch (err) {
      print("Error $err");
      return null;
    }
  }
}

// ? Login page

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> 
}
