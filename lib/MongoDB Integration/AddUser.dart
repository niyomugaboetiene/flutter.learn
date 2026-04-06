import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Adduser {
  static const BaseUrl = "http://localhost:5000";

  //     student_id, full_name,  gender, roll, email, trade, phone, location, class, password, last_login, is_approved
  static Future getUser(
      String full_name,
      String gender,
      String roll,
      String email,
      String trade,
      String phone,
      String location,
      String classes,
      String password) async {
    final response = await http.post(Uri.parse("$BaseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": full_name,
          "gender": gender,
          "roll": roll,
          "email": email,
          "trade": trade,
          "phone": phone,
          "location": location,
          "class": classes,
          "password": password
        }));

    return jsonDecode(response.body);
  }
}

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserState();
}

class _AddUserState extends State<AddUserScreen> {
  TextEditingController full_name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController trade = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController classes = TextEditingController();
  TextEditingController passwrod = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student"),),
      body: Column(

      ),
    );
  }
}
