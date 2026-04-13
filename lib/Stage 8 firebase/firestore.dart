// cloud firestore: is real time nosql cloud hosted database
// it contains: collection, documents

import 'package:cloud_firestore/cloud_firestore.dart';

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
