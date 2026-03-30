import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Theme extends StatefulWidget {
  const Theme({super.key});

  @override
  State<Theme> createState() => _ThemeState();
}

class _ThemeState extends State<Theme> {
  bool isDark = false;

  void initState() {
    super.initState();
    loadTheme();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isDark = prefs.getBool('isDark') ?? false;
    });
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isDark = !isDark;
    });

    prefs.setBool('isDark', isDark);
  }
}
