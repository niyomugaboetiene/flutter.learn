// SharedPreferences (key-value storage): is a way to store small data locally on the device
// SharedPreference allow our app to remember a small data even if our app is closed
// Get instance → Save data → Read data → Remove data

import 'package:shared_preferences/shared_preferences.dart';

// void preference() async {
//   final prefs =
//       await SharedPreferences.getInstance(); // to initialize preference

// saving the data
//   await prefs.setString('name', 'Etiene'); // save data
//   await prefs.setInt('age', 20);
//   await prefs.setBool('isLoggedIn', true);

// reading the data
//   final String? name = await prefs.getString('name') ?? "no name";
//   final int? age = await prefs.getInt('age') ?? 0;
//   final bool isLogged = await prefs.getBool('isLoggedIn') ?? false;

// removing data
// 1.removing all data
//   await prefs.clear();

// 2. removing specific data
//   await prefs.remove('name');
// }

import 'package:flutter/material.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  final TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preference Screen")),
      body: Column(
        children: [
           TextField(
               controller: username,
        decoration: InputDecoration(
            hintText: "Enter your username", labelText: "Username"),
      ),
        ],
        ) 
    );
  }
}
