import 'package:flutter/material.dart';

class InputFieldModel extends ChangeNotifier {
  String name = "Anna";

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}
