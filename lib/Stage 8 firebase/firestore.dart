// cloud firestore: is real time nosql cloud hosted database
// it contains: collection, documents

import 'package:cloud_firestore/cloud_firestore.dart';

// add user
Future<void> addUser() async {
  await FirebaseFirestore.instance
      .collection("users")
      .add({'name': 'etiene', 'age': 12, 'email': "et@gmail.com"});
}

// select users/ read

Future<void> getUsers() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("users").get();

  for (var user in snapshot.docs) {
    print(user.data());
  }
}


