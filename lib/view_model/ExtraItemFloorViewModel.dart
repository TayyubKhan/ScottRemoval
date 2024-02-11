import 'package:flutter/cupertino.dart';

class ExtraItemViewViewModel with ChangeNotifier {
  List<int> _allid = [];
  List<int> get allid => _allid;
  List<List<int>> _rid = [];
  List<List<int>> get rid => _rid;
  List<List<int>> _rsavedid = [];
  List<List<int>> get rsavedid => _rsavedid;

  List<List<String>> _rsavedItem = [];
  List<List<String>> get rsavedItem => _rsavedItem;
  String? _rselectedItem;
  String? get rselectedItem => _rselectedItem;
  int _counter = 1;
  int get counter => _counter;
  List<String> _rdropDownIList = ['Reassembly Service'];
  List<String> get rdropDownIList => _rdropDownIList;
  List<List<int>> _pid = [];
  List<List<int>> get pid => _pid;
  List<List<int>> _psavedid = [];
  List<List<int>> get psavedid => _psavedid;

  List<List<String>> _psavedItem = [];
  List<List<String>> get psavedItem => _psavedItem;
  String? _pselectedItem;
  String? get pselectedItem => _pselectedItem;
  int _pcounter = 1;
  int get pcounter => _pcounter;
  List<String> _pdropDownIList = ['Packing Service'];
  List<String> get pdropDownIList => _pdropDownIList;
  List<List<int>> _dismanltleid = [];
  List<List<int>> get dismanltleid => _dismanltleid;
  List<List<int>> _dismantlesavedid = [];
  List<List<int>> get dismantlesavedid => _dismantlesavedid;
  String? _dselectedItem;
  String? get dselectedItem => _dselectedItem;
  List<int> _list = [];
  List<int> get list => _list;
  int _dcounter = 1;
  int get dcounter => _dcounter;
  List<String> _ddropDownIList = ['Dismantling Service'];
  List<String> get ddropDownIList => _ddropDownIList;
  List<List<String>> _dsavedItem = [];
  List<List<String>> get dsavedItem => _dsavedItem;
  Map<int, List<String>> _orderSentItemsHistory = {};
  Map<int, List<String>> get orderSentItemsHistory => _orderSentItemsHistory;
  // void saveallid() {
  //   _allid.addAll(_rsavedid);
  //   _allid.addAll(_psavedid);
  //   _allid.addAll(_dismantlesavedid);
  // }
  //
  void addlist(int index) {
    _list = _rsavedid[index];
    notifyListeners();
  }

  void generate(int id) {
    // Initialize _allid, _rid, _rsavedid, _rsavedItem, _rdropDownIList, _pid, _psavedid, _psavedItem, _pdropDownIList,
    // _dismanltleid, _dismantlesavedid, _ddropDownIList, _dsavedItem, counters, pcounters, and Dcounters
    _rid = List<List<int>>.generate(id, (index) => []);
    _rsavedid = List<List<int>>.generate(id, (index) => []);
    _rsavedItem = List<List<String>>.generate(id, (index) => []);
    _pid = List<List<int>>.generate(id, (index) => []);
    _psavedid = List<List<int>>.generate(id, (index) => []);
    _psavedItem = List<List<String>>.generate(id, (index) => []);
    _dismanltleid = List<List<int>>.generate(id, (index) => []);
    _dismantlesavedid = List<List<int>>.generate(id, (index) => []);
    _dsavedItem = List<List<String>>.generate(id, (index) => []);

    counters = List.generate(
      id,
      (index) => List<Counter>.generate(100, (innerIndex) => Counter()),
    );

    pcounters = List.generate(
      id,
      (index) =>
          List<PackingCounter>.generate(100, (innerIndex) => PackingCounter()),
    );

    Dcounters = List.generate(
      id,
      (index) => List<DismantleCounter>.generate(
          100, (innerIndex) => DismantleCounter()),
    );
    print('Generated $id instances');
  }

  void getpid(int Id, int index) {
    _pid[index].add(Id);
  }

  void getid(int Id, int index) {
    _dismanltleid[index].add(Id);
  }

  void getrid(int Id, int index) {
    _rid[index].add(Id);
  }

  void getpsavedid(int Id, int index) {
    if (!_psavedid[index].contains(Id)) {
      _psavedid[index].add(Id);
      notifyListeners();
    }
  }

  void getrsavedid(int Id, int index) {
    if (!_rsavedid[index].contains(Id)) {
      _rsavedid[index].add(Id);
      notifyListeners();
    }
  }

  void getsavedid(int Id, int index) {
    if (!_dismantlesavedid[index].contains(Id)) {
      _dismantlesavedid[index].add(Id);
      notifyListeners();
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

  void storeSentItemsHistoryForOrder(int orderId, List<String> savedItems,
      List<dynamic> counters, String type) {
    if (!_orderSentItemsHistory.containsKey(orderId)) {
      _orderSentItemsHistory[orderId] = [];
    }

    List<String> sentItemsHistory = _orderSentItemsHistory[orderId]!;
    for (int i = 0; i < savedItems.length; i++) {
      String item = savedItems[i];
      int quantity = counters[i].value;

      int index = sentItemsHistory
          .indexWhere((element) => element.startsWith('$item:'));
      if (index != -1) {
        sentItemsHistory[index] = '$item:$quantity';
      } else {
        sentItemsHistory.add('$item:$quantity');
      }
    }
  }

  // void clear() {
  //   _psavedItem = [];
  //   _dsavedItem = [];
  //   _pid = [];
  //   _psavedid = [];
  //   _dismanltleid = [];
  //   _dismantlesavedid = [];
  //   _rid = [];
  //   _rsavedid = [];
  //   _rsavedItem = [];
  // }

  void saveitem(String item, int index) {
    if (item == 'Reassembly Service' || _rsavedItem[index].contains(item)) {
    } else {
      _rsavedItem[index].add(item);
      _rsavedItem[index].reversed;
    }
    notifyListeners();
  }

  void savepitem(String item, int index) {
    if (item == 'Packing Service' || _psavedItem[index].contains(item)) {
    } else {
      _psavedItem[index].add(item);
      _psavedItem[index].reversed;
    }
    notifyListeners();
  }

  void dsaveitem(String item, int index) {
    if (item == 'Dismantling Service' || _dsavedItem[index].contains(item)) {
    } else {
      _dsavedItem[index].add(item);
      _dsavedItem[index].reversed;
    }
    notifyListeners();
  }

  List<String> removeitem(int index, int index2) {
    _rsavedItem[index2].removeAt(index);
    notifyListeners();
    return _rsavedItem[index2];
  }

  List<String> removepitem(int index, int index2) {
    _psavedItem[index2].removeAt(index);
    notifyListeners();
    return _psavedItem[index2];
  }

  List<String> dremoveitem(int index, int index2) {
    _dsavedItem[index2].removeAt(index);
    notifyListeners();
    return _dsavedItem[index2];
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

  List<List<PackingCounter>> pcounters = [];
  List<List<Counter>> counters = [];
  List<List<DismantleCounter>> Dcounters = [];

  void incrementCounter(int index, int itemIndex) {
    counters[index][itemIndex].increment();
    notifyListeners();
  }

  void decrementCounter(int index, int itemIndex) {
    counters[index][itemIndex].decrement();
    notifyListeners();
  }

  void incrementDCounter(int index, int itemIndex) {
    Dcounters[index][itemIndex].increment();
    notifyListeners();
  }

  void decrementDCounter(int index, int itemIndex) {
    Dcounters[index][itemIndex].decrement();
    notifyListeners();
  }

  void incrementPCounter(int index, int itemIndex) {
    pcounters[index][itemIndex].increment();
    notifyListeners();
  }

  void decrementPCounter(int index, int itemIndex) {
    pcounters[index][itemIndex].decrement();
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
