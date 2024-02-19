import 'package:flutter/material.dart';

class FloorModel extends ChangeNotifier {
  String? _selectedFloor;
  String? get selectedFloor => _selectedFloor;

  void selectFloor(String? value) {
    _selectedFloor = value;
    notifyListeners();
  }
}
