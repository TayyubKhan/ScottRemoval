import 'package:flutter/foundation.dart';

class DataViewViewModel with ChangeNotifier {
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

  List<String> setData2(List<String> newData) {
    _data2.addAll(newData);
    notifyListeners();
    return _data2;
  }

  List<String> remove() {
    _data2.clear();
    return _data2;
  }

  void getPrice(int Price) {
    _price = _price + Price;
    notifyListeners();
  }
}
