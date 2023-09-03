import 'package:flutter/material.dart';

class TempProvider with ChangeNotifier {
  List<String> _name = ['Select Item'];
  List<String> get name => _name;
  List<dynamic> _data = [];
  List<dynamic> get data => _data;
  List<dynamic> _saveddata = ['Select Item'];
  List<dynamic> get savedData => _data;
  List<int?> _savedid = [];
  List<int?> get savedid => _savedid;
  String? _selectedItem;
  String? get selectedItem => _selectedItem;
  void getData(List<dynamic> apiData) {
    if (!_data.contains(apiData)) {
      _data.addAll(apiData);
    }
  }

  void getName(String name) {
    if (!_name.contains(name)) {
      _name.add(name);
    }
  }

  void saveData(String item) {
    if (item == 'Select Item' || _saveddata.contains(item)) {
    } else {
      _saveddata.add(item);
      _saveddata.reversed;
    }
  }

  void clear() {
    _data = [];
  }
}
