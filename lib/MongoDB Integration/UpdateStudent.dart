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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update student"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(controller: full_name, decoration: InputDecoration(labelText: "Full name"),)
        ],
      ),
    );
  }
}
