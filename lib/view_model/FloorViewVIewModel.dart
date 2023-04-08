import 'package:flutter/material.dart';

class FloorModel extends ChangeNotifier {
  String? _selectedFloor;
  String? get selectedFloor => _selectedFloor;

  set selectedFloor(String? value) {
    _selectedFloor = value;
    notifyListeners();
  }
}
