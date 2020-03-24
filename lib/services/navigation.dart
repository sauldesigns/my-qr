import 'package:flutter/material.dart';

class NavigationService with ChangeNotifier {
  int _index;

  int get index => _index;

  NavigationService() {
    _index = 0;
  }

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
