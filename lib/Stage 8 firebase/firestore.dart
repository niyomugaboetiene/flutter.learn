// cloud firestore: is real time nosql cloud hosted database
// it contains: collection, documents

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// add user
// Future<void> addUser() async {
//   await FirebaseFirestore.instance
//       .collection("users")
//       .doc("user_123")
//       .set({'name': 'etiene', 'age': 12, 'email': "et@gmail.com"});
// }

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
  final TextEditingController idController = TextEditingController();

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  bool isLoading = false;
  Future<void> addUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      if (nameController.text.trim().isNotEmpty &&
          ageController.text.trim().isNotEmpty &&
          emailController.text.trim().isNotEmpty) {
        await FirebaseFirestore.instance.collection("users").add({
          "name": nameController.text.trim(),
          "age": int.tryParse(ageController.text.trim()) ?? 0,
          "email": emailController.text.trim()
        });

        setState(() {
          isLoading = false;
        });

        if (!mounted) return;

        showMessage("User added successfully");

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ListScreen()));
      } else {
        if (!mounted) return;
        showMessage("Please fill out all fields");
      }
    } on FirebaseException catch (e) {
      print("ERROR: $e");
      if (!mounted) return;
      showMessage("Error ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add user"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                  onPressed: () {
                    addUser();
                  },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text("Add User")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListScreen()));
                  },
                  child: Text("View"))
            ])
          ],
        ));
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<QuerySnapshot> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  Future<QuerySnapshot> fetchUsers() async {
    return await FirebaseFirestore.instance.collection("users").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User list"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }

            var users = snapshot.data!.docs;

            return ListView(
              children: users.map((doc) {
                var data = doc.data() as Map<String, dynamic>;

                return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    child: SingleChildScrollView(
                      child: ListTile(
                        title: Text(
                          data["name"] ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Age: ${data["age"] ?? ""}"),
                              SizedBox(height: 2),
                              Text("Email: ${data["email"] ?? ""}"),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateScreen(id: doc.id)));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeleteUserScreen(
                                                        id: doc.id)));
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              }).toList(),
            );
          }),
    );
  }
}

// * update screen
class UpdateScreen extends StatefulWidget {
  final String id;

  const UpdateScreen({super.key, required this.id});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isloading = false;
  Future<void> updateUser() async {
    try {
      setState(() {
        isloading = true;
      });
      await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.id)
          .update({
        "name": nameController.text,
        "age": int.tryParse(ageController.text),
        "email": emailController.text
      });

      setState(() {
        isloading = false;
      });
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User updated successfully")));

      Navigator.pop(context);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to update user")));
    }
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.id)
          .get();

      if (!data.exists) return;

      final doc = data.data() as Map<String, dynamic>;

      if (!mounted) return;

      setState(() {
        nameController.text = doc['name'] ?? "";
        ageController.text = doc['age'].toString();
        emailController.text = doc['email'] ?? "";
      });
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to update user")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update user"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                  onPressed: () {
                    updateUser();
                  },
                  child: isloading
                      ? CircularProgressIndicator()
                      : Text("update User")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("back"))
            ])
          ],
        ));
  }
}

// ? delete User
class DeleteUserScreen extends StatefulWidget {
  final String id;

  const DeleteUserScreen({super.key, required this.id});

  @override
  State<DeleteUserScreen> createState() = _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUserScreen> {
  
}
