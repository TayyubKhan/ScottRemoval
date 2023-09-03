import 'dart:io';

import 'package:flutter/foundation.dart';

class DataViewViewModel with ChangeNotifier {
  List<String> _urls = [];
  List<String> get urls => _urls;
  List<String> _wavdata = [];
  List<String> get wavdata => _wavdata;
  List<List<File>> _imageFiles = [];
  List<List<File>> get imageFiles => _imageFiles;
  List<String> _cmt = [];
  List<String> get cmt => _cmt;
  List<Map<String, dynamic>> _dataList = [];
  List<Map<String, dynamic>> get dataList => _dataList;
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
  List<Uint8List?> _signature = [];
  List<Uint8List?> get signature => _signature;

  void setSignatureBytes(Uint8List bytes, int index) {
    _signature[index] = bytes;
    notifyListeners();
  }

  void getUrl(String url) {
    if (_urls.contains(url)) {
    } else {
      _urls.add(url);
      notifyListeners();
    }
  }

  void createwavdata(int id) {
    _imageFiles = List<List<File>>.generate(id, (index) => []);
    _wavdata = List<String>.generate(id, (index) => '');
    _cmt = List<String>.generate(id, (index) => '');
    _signature = List<Uint8List>.generate(id, (index) => Uint8List(0));
  }

  List<String> setData(List<String> newData) {
    _data.addAll(newData);
    notifyListeners();
    return _data;
  }

  void getdata(String data, int index) {
    _wavdata[index] = data;
    notifyListeners();
  }

  void setImages(List<File> data, int index) {
    _imageFiles[index] = data;
    notifyListeners();
  }

  void setImages2(File data, int index, int index2) {
    _imageFiles[index].insert(index, data);
    notifyListeners();
  }

  void getdata2(String data, int index) {
    _cmt[index] = data;
    notifyListeners();
  }

  void setAPIData(List<Map<String, dynamic>> newData) {
    _dataList.clear();
    _dataList.addAll(newData);
    notifyListeners();
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
