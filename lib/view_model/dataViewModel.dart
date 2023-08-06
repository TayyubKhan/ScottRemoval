import 'package:flutter/foundation.dart';

class DataViewViewModel with ChangeNotifier {
  bool _status = true;
  int _index = 0;
  int get index => _index;
  bool get status => _status;
  List<String> _data = [];
  List<String> _data2 = [];
  int _price = 0;
  int get price => _price;
  List<String> get data => _data;
  List<String> get data2 => _data2;

  List<String> setData(List<String> newData) {
    _data.addAll(newData);
    notifyListeners();
    return _data;
  }

  void setStatus(bool Status) {
    _status = Status;
    notifyListeners();
  }

  void setIndex(index) {
    _index = index;
    notifyListeners();
  }

  void clear() {
    _data = [];
    _data2 = [];
  }

  List<String> setData2(List<String> newData) {
    _data2.addAll(newData);
    notifyListeners();
    return _data2;
  }

  List<String> remove() {
    _data2.clear();
    return _data2;
  }

  void removeprice() {
    _price = 0;
    notifyListeners();
  }

  void getPrice(double Price) {
    _price = _price + Price.toInt();
    notifyListeners();
  }
}
