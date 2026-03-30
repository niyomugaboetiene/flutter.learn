import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemeState();
}

class _ThemeState extends State<Themes> {
  bool isDark = false;

@override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text("Theme app"),
        backgroundColor: isDark ? Colors.grey : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              isDark ? "Dark mode 🌙" : "Light mode ☀️",
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: toggleTheme, 
              child: Text("Toggle theme")
            )
          ],
        ),
      ),
    );
  }
}
