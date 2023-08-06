import 'package:flutter/cupertino.dart';

class ItemViewViewModel with ChangeNotifier {
  List<int?> _id = [];
  List<int?> get id => _id;
  List<int?> _savedid = [];
  List<int?> get savedid => _savedid;
  String? _selectFloor = 'Select Floor';
  String? get selectFloor => _selectFloor;
  String? _selectedFloor;
  String? get selectedFloor => _selectedFloor;
  String? _selectedItem;
  String? get selectedItem => _selectedItem;
  List<int?> _list = [];
  List<int?> get list => _list;
  set selectedItem(String? value) {
    _selectedFloor = value;
    notifyListeners();
  }

  void addlist() {
    _list = _savedid;
    notifyListeners();
  }

  void getid(int Id) {
    _id.add(Id);
  }

  void getsavedid(int Id) {
    if (_savedid.contains(Id)) {
    } else {
      _savedid.add(Id);
    }
  }

  String? SelectedFloor(value) {
    _selectFloor = value;
    notifyListeners();
    return _selectedFloor;
  }

  List<String> _dropDownIList2 = ['Select Floor'];
  List<String> get dropDownIList2 => _dropDownIList2;
  int _counter = 1;
  int get counter => _counter;
  List<String> _dropDownIList = ['Select Item'];
  List<String> get dropDownIList => _dropDownIList;
  List<String> _savedItem = [];
  List<String> get savedItem => _savedItem;
  void getFloor(String item) {
    if (dropDownIList2.contains(item)) {
    } else {
      dropDownIList2.add(item);
    }
  }

  void getItem(String item) {
    if (dropDownIList.contains(item)) {
    } else {
      dropDownIList.add(item);
    }
  }

  List<String> passFloor() {
    notifyListeners();
    return _dropDownIList2;
  }

  List<String> passitem() {
    notifyListeners();
    return _dropDownIList;
  }

  void clear() {
    _id = [];
    _savedid = [];
    _savedItem = [];
  }

  void saveitem(String item) {
    if (item == 'Select Item' && _savedItem.contains(item)) {
    } else {
      _savedItem.add(item);
      _savedItem.reversed;
    }
    notifyListeners();
  }

  List<String> removeitem(int index) {
    _savedItem.removeAt(index);
    notifyListeners();
    return _savedItem;
  }

  void removeItem() {
    _dropDownIList = [];
  }

  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    notifyListeners();
  }

  List<Counter> counters = List.generate(100, (index) => Counter());

  void incrementCounter(int index) {
    counters[index].increment();
    notifyListeners();
  }

  void decerementCounter(int index) {
    counters[index].decrement();
    notifyListeners();
  }
}

class Counter {
  int value;

  Counter({this.value = 1});

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}
