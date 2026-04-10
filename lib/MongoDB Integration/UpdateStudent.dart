import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Adduser {
  static const BaseUrl = "http://localhost:5000";

  //     student_id, full_name,  gender, roll, email, trade, phone, location, class, password, last_login, is_approved
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
}

class UpdateScreen extends StatefulWidget {

}