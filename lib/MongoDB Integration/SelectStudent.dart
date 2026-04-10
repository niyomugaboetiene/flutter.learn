import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student {
  String? id;
  String? full_name;
  String? gender;
  String? roll;
  String? email;
  String? trade;
  String? phone;
  String? location;
  String? classes;
  String? password;

  Student(
      {required this.id,
      required this.full_name,
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
        id: json['_id'],
        full_name: json['full_name'],
        gender: json['gender'],
        roll: json['roll'],
        email: json['email'],
        trade: json['trade'],
        phone: json['phone'],
        location: json['location'],
        classes: json['class'],
        password: json['password']);
  }
}

Future<List<Student>> fetchStudent() async {
  const BaseUrl = "http://localhost:5000";

  try {
    final response = await http.get(Uri.parse('$BaseUrl/student/studentList'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decoded = jsonDecode(response.body);

      final List student = decoded['student'] ?? [];

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
  late Future<List<Student>> futureStudent;

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
      body: FutureBuilder<List<Student>>(
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

            final students = snapshot.data ?? [];

            return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];

                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateScreen(_id: student.id)));
                                },
                                icon: Icon(Icons.edit, color: Colors.blue),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("Delete ${student.full_name}");
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                          Text(student.full_name ?? "No name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 5),
                          Text("Email: ${student.email ?? "No email"}"),
                          Text("Gender: ${student.gender ?? "No gender"}"),
                          Text("Roll: ${student.roll ?? "No roll"}"),
                          Text("Phone: ${student.phone ?? "No phone"}"),
                          Text(
                              "Location: ${student.location ?? "No location"}"),
                          Text("Trade: ${student.trade ?? "No trade"}"),
                          Text("Class: ${student.classes ?? "No class"}"),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
