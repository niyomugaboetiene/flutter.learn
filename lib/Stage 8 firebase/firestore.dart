// cloud firestore: is real time nosql cloud hosted database
// it contains: collection, documents

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// add user
Future<void> addUser() async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc("user_123")
      .set({'name': 'etiene', 'age': 12, 'email': "et@gmail.com"});
}

// select users/ read
Future<void> getUsers() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("users").get();

  for (var user in snapshot.docs) {
    print(user.data());
  }
}

// update user
Future<void> updateUser() async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc("user_123")
      .update({'age': 19});
}

// delete user

Future<void> deleteUser() async {
  await FirebaseFirestore.instance.collection("users").doc("user_123").delete();
}

// Add user screen

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserScreen();
}

class _AddUserScreen extends State<AddUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> addUser() async {
    if (nameController.text.isNotEmpty ||
        ageController.text.isNotEmpty ||
        emailController.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection("users").doc("1").set({
        "name": nameController.text,
        "age": ageController.text,
        "email": emailController.text
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User added sucessfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add user"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),
        ],
      ),
    )
  }
}
