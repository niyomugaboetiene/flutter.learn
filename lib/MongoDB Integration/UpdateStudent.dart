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
        headers: { "Content-Type" : "application/json" },
        body: jsonEncode({
          
        })
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
