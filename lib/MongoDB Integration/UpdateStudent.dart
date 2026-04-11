import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateScreen extends StatefulWidget {
  final String id;

  const UpdateScreen({super.key, required this.id});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  static const BaseUrl = "http://localhost:5000";

  final TextEditingController full_name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController roll = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController trade = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController classes = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> updateUser() async {
    final response =
        await http.put(Uri.parse("$BaseUrl/student/update/${widget.id}"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "full_name": full_name.text,
              "gender": gender.text,
              "roll": roll.text,
              "email": email.text,
              "trade": trade.text,
              "phone": phone.text,
              "location": location.text,
              "class": classes.text,
              "password": password.text
            }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Updated successfully")));

      Navigator.pop(context);
    } else {
      throw Exception("Failed to update the user");
    }
  }

  Future<void> fetchUser() async {
    final response = await http.get(Uri.parse("$BaseUrl/student/${widget.id}"));

    final data = jsonDecode(response.body);

    setState(() {
      full_name.text = data['full_name'] ?? "";
      gender.text = data['gender'] ?? "";
      roll.text = data['roll'] ?? "";
      email.text = data['email'] ?? "";
      trade.text = data['trade'] ?? "";
      phone.text = data['phone'] ?? "";
      location.text = data['location'] ?? "";
      password.text = data['password'] ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update student"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: full_name,
            decoration: InputDecoration(labelText: "Full name"),
          ),
          TextField(
            controller: gender,
            decoration: InputDecoration(labelText: "gender"),
          ),
          TextField(
            controller: roll,
            decoration: InputDecoration(labelText: "roll"),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(labelText: "email"),
          ),
          TextField(
            controller: trade,
            decoration: InputDecoration(labelText: "trade"),
          ),
          TextField(
            controller: phone,
            decoration: InputDecoration(labelText: "phone"),
          ),
          TextField(
            controller: location,
            decoration: InputDecoration(labelText: "location"),
          ),
          TextField(
            controller: classes,
            decoration: InputDecoration(labelText: "classes"),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(labelText: "password"),
          ),
          ElevatedButton(onPressed: updateUser, child: Text("Update"))
        ],
      ),
    );
  }
}
