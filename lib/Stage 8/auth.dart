// flutterfire: is like bridge between flutter app and firebase
// firebase project it it like my backend server on cloud

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // provide firebase authentication service
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } on FirebaseAuthException catch (err) {
      throw err;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      // UserCredentails is object returned by firebase and metadata
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e;
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
      return "password must be at least 6 characters";
    }

    return null;
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  String handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case "email-already-in-use":
        return "this email is already used by another person";

      case "invalid-email":
        return "Email format is invalid";

      case "weak-password":
        return "Password is too weak (min 6 chars)";

      case "user-not-found":
        return "No account found with this email";

      case "wrong-password":
        return "Incorrect password";

      case "invalid-credential":
        return "Invalid email or password";

      default:
        return "some thing went wrong ${e.message}";
    }
  }

  void submit() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? error = validateInput(email, password);

    if (error != null) {
      showMessage(error);
      return null; // to stop execution
    }

    try {
      if (isLogin) {
        User? user = await _auth.login(email, password);
        if (user != null) {
          showMessage("Login successfully");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GreetingScreen()));
        }
      } else {
        await _auth.signUp(email, password);
        showMessage("Register successfully");
      }
    } on FirebaseAuthException catch (e) {
      showMessage(handleFirebaseError(e));
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
        ));
  }
}

// Gretting screen

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Welcome you're almost in !!!!"),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return GreetingScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
