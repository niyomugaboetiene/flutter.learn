import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student {
  String full_name;
  String gender;
  String roll;
  String email;
  String trade;
  String phone;
  String location;
  String classes;
  String password;

  Student(
      {required this.full_name,
      required this.gender,
      required this.roll,
      required this.email,
      required this.trade,
      required this.phone,
      required this.location,
      required this.classes,
      required this.password});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        full_name: json['full_name'],
        gender: json['gender'],
        roll: json['roll'],
        email: json['email'],
        trade: json['trade'],
        phone: json['phone'],
        location: json['location'],
        classes: json['classes'],
        password: json['password']);
  }
}

Future<List<Student>> fetchStudent() async {
  const BaseUrl = "http://localhost:5000";

  try {
    final response =
        await http.get(Uri.parse('${BaseUrl}/student/studentList'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List student = jsonDecode(response.body);

      return student.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load user");
    }
  } catch (err) {
    throw Exception(err);
  }
}

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}


class _StudentScreenState extends State<StudentScreen> {
    
}