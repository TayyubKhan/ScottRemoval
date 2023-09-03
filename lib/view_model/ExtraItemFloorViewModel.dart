import 'package:flutter/cupertino.dart';

class ExtraItemViewViewModel with ChangeNotifier {
  List<int> _allid = [];
  List<int> get allid => _rid;
  List<int> _rid = [];
  List<int> get rid => _rid;
  List<int> _rsavedid = [];
  List<int> get rsavedid => _rsavedid;
  String? _rselectedItem;
  String? get rselectedItem => _rselectedItem;
  List<String> _rsavedItem = [];
  List<String> get rsavedItem => _rsavedItem;
  int _counter = 1;
  int get counter => _counter;
  List<String> _rdropDownIList = ['Reassembly Service'];
  List<String> get rdropDownIList => _rdropDownIList;
  List<int> _pid = [];
  List<int> get pid => _pid;
  List<int> _psavedid = [];
  List<int> get psavedid => _psavedid;
  String? _pselectedItem;
  String? get pselectedItem => _pselectedItem;
  List<String> _psavedItem = [];
  List<String> get psavedItem => _psavedItem;
  int _pcounter = 1;
  int get pcounter => _pcounter;
  List<String> _pdropDownIList = ['Packing Service'];
  List<String> get pdropDownIList => _pdropDownIList;
  List<int> _dismanltleid = [];
  List<int> get dismanltleid => _dismanltleid;
  List<int> _dismantlesavedid = [];
  List<int> get dismantlesavedid => _dismantlesavedid;
  String? _dselectedItem;
  String? get dselectedItem => _dselectedItem;
  List<int> _list = [];
  List<int> get list => _list;
  int _dcounter = 1;
  int get dcounter => _dcounter;
  List<String> _ddropDownIList = ['Dismantling Service'];
  List<String> get ddropDownIList => _ddropDownIList;
  List<String> _dsavedItem = [];
  List<String> get dsavedItem => _dsavedItem;
  void saveallid() {
    _allid.addAll(_rsavedid);
    _allid.addAll(_psavedid);
    _allid.addAll(_dismantlesavedid);
  }

  void addlist() {
    _list = _rsavedid;
    notifyListeners();
  }

  void getpid(int Id) {
    _pid.add(Id);
  }

  void getid(int Id) {
    _dismanltleid.add(Id);
  }

  void getrid(int Id) {
    _rid.add(Id);
  }

  void getpsavedid(int Id) {
    if (_psavedid.contains(Id)) {
    } else {
      _psavedid.add(Id);
    }
  }

  void getrsavedid(int Id) {
    if (_rsavedid.contains(Id)) {
    } else {
      _rsavedid.add(Id);
    }
  }

  void getsavedid(int Id) {
    if (_dismantlesavedid.contains(Id)) {
    } else {
      _dismantlesavedid.add(Id);
    }
  }

  void getpItem(String item) {
    if (pdropDownIList.contains(item)) {
    } else {
      pdropDownIList.add(item);
    }
  }

  void getItem(String item) {
    if (ddropDownIList.contains(item)) {
    } else {
      ddropDownIList.add(item);
    }
  }

  void getrItem(String item) {
    if (rdropDownIList.contains(item)) {
    } else {
      rdropDownIList.add(item);
    }
  }

  List<String> passitem() {
    notifyListeners();
    return _rdropDownIList;
  }

  void clear() {
    _psavedItem = [];
    _dsavedItem = [];
    _pid = [];
    _psavedid = [];
    _dismanltleid = [];
    _dismantlesavedid = [];
    _rid = [];
    _rsavedid = [];
    _rsavedItem = [];
  }

  void saveitem(String item) {
    if (item == 'Reassembly Service' || _rsavedItem.contains(item)) {
    } else {
      _rsavedItem.add(item);
      _rsavedItem.reversed;
    }
    notifyListeners();
  }

  void savepitem(String item) {
    if (item == 'Packing Service' || _psavedItem.contains(item)) {
    } else {
      _psavedItem.add(item);
      _psavedItem.reversed;
    }
    notifyListeners();
  }

  void dsaveitem(String item) {
    if (item == 'Dismantling Service' || _dsavedItem.contains(item)) {
    } else {
      _dsavedItem.add(item);
      _dsavedItem.reversed;
    }
    notifyListeners();
  }

  List<String> removeitem(int index) {
    _rsavedItem.removeAt(index);
    notifyListeners();
    return _rsavedItem;
  }

  List<String> removepitem(int index) {
    _psavedItem.removeAt(index);
    notifyListeners();
    return _psavedItem;
  }

  List<String> dremoveitem(int index) {
    _dsavedItem.removeAt(index);
    notifyListeners();
    return _dsavedItem;
  }

  void removeItem() {
    _rdropDownIList = [];
  }

  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void addDCounter() {
    if (_dcounter >= 1) {
      _dcounter++;
    }

    notifyListeners();
  }

  void removeCounter() {
    if (_dcounter >= 1) {
      _dcounter--;
    }
    notifyListeners();
  }

  void removeDCounter() {
    _dcounter--;
    notifyListeners();
  }

  List<Counter> pcounters = List.generate(100, (index) => Counter());
  List<Counter> counters = List.generate(100, (index) => Counter());
  List<DismantleCounter> Dcounters =
      List.generate(100, (index) => DismantleCounter());
  void incrementCounter(int index) {
    counters[index].increment();
    notifyListeners();
  }

  void decerementCounter(int index) {
    counters[index].decrement();
    notifyListeners();
  }

  void incrementDCounter(int index) {
    Dcounters[index].increment();
    notifyListeners();
  }

  void decerementDCounter(int index) {
    Dcounters[index].decrement();
    notifyListeners();
  }

  void incrementPCounter(int index) {
    pcounters[index].increment();
    notifyListeners();
  }

  void decerementPCounter(int index) {
    pcounters[index].decrement();
    notifyListeners();
  }
}

class DismantleCounter {
  int value;

  DismantleCounter({this.value = 1});

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}

class PackingCounter {
  int value;

  PackingCounter({this.value = 1});

  void increment() {
    value++;
  }

  void decrement() {
    value--;
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
