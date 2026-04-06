import 'dart:convert';
import 'package:http/http.dart' as http;

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
        body: jsonDecode({
          full_name
        }));
  }
}
