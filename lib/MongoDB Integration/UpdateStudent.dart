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

  static Future<Map<String, dynamic>> getUser(
      String full_name,
      String gender,
      String roll,
      String email,
      String trade,
      String phone,
      String location,
      String classes,
      String password) async {

    final response = await http.post(Uri.parse("$BaseUrl/student/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": full_name,
          "gender": gender,
          "roll": roll,
          "email": email,
          "trade": trade,
          "phone": phone,
          "location": location,
          "classe": classes,
          "password": password
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to add user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
