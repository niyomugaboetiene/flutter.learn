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
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  bool isLogin = true;

  String? validateInput(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return "Pasword or email is empty";
    }

    if (!email.contains("@") || !email.contains(".")) {
      return "please enter a valid email";
    }

    if (password.length < 6) {
      return "password must be at least > 6";
    }

    return null;
  }

  void submit() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? error = validateInput(email, password);

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    }

    if (isLogin) {
      _auth.login(email, password);
    } else {
      _auth.signUp(email, password);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? "Login" : "Sign In"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            ElevatedButton(
                onPressed: submit, child: Text(isLogin ? "Login" : "SignUp")),
            TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(isLogin
                    ? "Create account"
                    : "Already have account ? login"))
          ],
        ),
      ),
    );
  }
}
