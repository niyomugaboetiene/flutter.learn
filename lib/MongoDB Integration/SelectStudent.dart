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

Future<Student> fetchStudent() async {
  const BaseUrl = "http://localhost:5000";

  try {
    final response =
        await http.get(Uri.parse('${BaseUrl}/student/studentList'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final  student = jsonDecode(response.body);
      return Student.fromJson(student);
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
  late Future<Student> futureStudent;

  @override
  void initState() {
    super.initState();
    futureStudent = fetchStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: FutureBuilder<Student>(
          future: futureStudent,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error ${snapshot.error}"),
              );
            }

            final students = snapshot.data!;
                  return ListTile(
                    title: Text("${students.full_name}"),
                    subtitle: Column(
                      children: [
                        Text("${students.email}"),
                        Text("${students.gender}"),
                        Text("${students.roll}"),
                        Text("${students.phone}"),
                        Text("${students.location}"),
                        Text("${students.trade}"),
                        Text("${students.classes}"),
                      ],
                    ),
                  );
              
          }),
    );
  }
}
