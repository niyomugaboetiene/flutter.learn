// State Management (Advanced)  Provider (most common beginner-friendly):
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners(); // for rebuild the UI
  }
}
