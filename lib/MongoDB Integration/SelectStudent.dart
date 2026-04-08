import 'package:flutter/material.dart';

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
        password: json['password']
    );
  }
}
