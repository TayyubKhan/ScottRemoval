// import 'package:flutter/cupertino.dart';
//
// class ItemViewViewModel with ChangeNotifier {
//   List<int?> _id = [];
//   List<int?> get id => _id;
//   List<int?> _savedid = [];
//   List<int?> get savedid => _savedid;
//   String? _selectFloor = 'Select Floor';
//   String? get selectFloor => _selectFloor;
//   String? _selectedFloor;
//   String? get selectedFloor => _selectedFloor;
//   String? _selectedItem;
//   String? get selectedItem => _selectedItem;
//   List<int?> _list = [];
//   List<int?> get list => _list;
//   List<Map<dynamic, String>> _item = [];
//   List<Map<dynamic, String>> get item => _item;
//   Map<int, List<String>> _orderSentItemsHistory = {};
//   Map<int, List<String>> get orderSentItemsHistory => _orderSentItemsHistory;
//
//   set selectedItem(String? value) {
//     _selectedFloor = value;
//     notifyListeners();
//   }
//
//   void addlist() {
//     _list = _savedid;
//     notifyListeners();
//   }
//
//   void getid(int Id) {
//     _id.add(Id);
//   }
//
//   void getsavedid(int Id) {
//     if (_savedid.contains(Id)) {
//     } else {
//       _savedid.add(Id);
//       notifyListeners();
//     }
//   }
//
//   String? SelectedFloor(value) {
//     _selectFloor = value;
//     notifyListeners();
//     return _selectedFloor;
//   }
//
//   List<String> _dropDownIList2 = ['Select Floor'];
//   List<String> get dropDownIList2 => _dropDownIList2;
//   int _counter = 1;
//   int get counter => _counter;
//   List<String> _dropDownIList = ['Select Item'];
//   List<String> get dropDownIList => _dropDownIList;
//   List<String> _savedItem = [];
//   List<String> get savedItem => _savedItem;
//   void getFloor(String item) {
//     if (dropDownIList2.contains(item)) {
//     } else {
//       dropDownIList2.add(item);
//     }
//   }
//
//   void getItem(String item) {
//     if (dropDownIList.contains(item)) {
//     } else {
//       dropDownIList.add(item);
//     }
//   }
//
//   List<String> passFloor() {
//     notifyListeners();
//     return _dropDownIList2;
//   }
//
//   List<String> passitem() {
//     notifyListeners();
//     return _dropDownIList;
//   }
//
//   void clear() {
//     _id = [];
//     _savedid = [];
//     _savedItem = [];
//   }
//
//   void saveitem(String item) {
//     if (item == 'Select Item' || _savedItem.contains(item)) {
//     } else {
//       _savedItem.add(item);
//       _savedItem.reversed;
//     }
//     notifyListeners();
//   }
//
//   // List<String> removeitem(int index) {
//   //   _savedItem.removeAt(index);
//   //   notifyListeners();
//   //   return _savedItem;
//   // }
//   List<String> removeitem(int index) {
//     _savedItem.removeAt(index);
//     _savedid.removeAt(index);
//     notifyListeners();
//     return _savedItem;
//   }
//
//   void removeItem() {
//     _dropDownIList = [];
//   }
//
//   void addCounter() {
//     _counter++;
//     notifyListeners();
//   }
//
//   void removeCounter() {
//     _counter--;
//     notifyListeners();
//   }
//
//   List<Counter> counters = List.generate(100, (index) => Counter());
//
//   void incrementCounter(int index) {
//     counters[index].increment();
//     notifyListeners();
//   }
//
//   void decerementCounter(int index) {
//     counters[index].decrement();
//     notifyListeners();
//   }
//
//   void storeSentItemsHistoryForOrder(int orderId) {
//     if (!_orderSentItemsHistory.containsKey(orderId)) {
//       _orderSentItemsHistory[orderId] = [];
//     }
//
//     List<String> sentItemsHistory = _orderSentItemsHistory[orderId]!;
//     for (int i = 0; i < _savedItem.length; i++) {
//       String item = _savedItem[i];
//       int quantity = counters[i].value;
//       int index = sentItemsHistory
//           .indexWhere((element) => element.startsWith('$item:'));
//       if (index != -1) {
//         sentItemsHistory[index] = '$item:$quantity';
//       } else {
//         sentItemsHistory.add('$item:$quantity');
//       }
//     }
//   }
//
//   Map<String, dynamic> getExtraQuantitiesForOrder(int orderId, id, itemm) {
//     Map<String, dynamic> extraQuantities = {};
//
//     if (_orderSentItemsHistory.containsKey(orderId)) {
//       List<String> sentItemsHistory = _orderSentItemsHistory[orderId]!;
//
//       String item = itemm['name'];
//       int quantity = int.parse(itemm['quantity']);
//       print(quantity);
//       // Check if the item is in the sent items history
//       int index = sentItemsHistory
//           .indexWhere((element) => element.startsWith('$item:'));
//
//       if (index != -1) {
//         // Extract the quantity from the history entry
//         int historyQuantity = int.parse(sentItemsHistory[index].split(':')[1]);
//         print(historyQuantity.toString()+'s'+quantity.toString());
//         if (quantity > historyQuantity) {
//           print('object--');
//           int extraQuantity = quantity - historyQuantity;
//           extraQuantities = {
//             'item': item,
//             'quantity': extraQuantity.toString(),
//             "id": id,
//             "tab": "Living",
//             "type": "house_removal",
//             "parent": "498",
//             "parent_name": ""
//           };
//         }
//       } else {
//         print('object++');
//         extraQuantities = {
//           'item': item,
//           'quantity': quantity.toString(),
//           "id": id,
//           "tab": "Living",
//           "type": "house_removal",
//           "parent": "498",
//           "parent_name": ""
//           // Add other necessary properties...
//         };
//         print(extraQuantities);
//       }
//     }
//     return extraQuantities;
//   }
//   void deleteItemHistory(String itemName) {
//     _orderSentItemsHistory.forEach((orderId, sentItemsHistory) {
//       int index = sentItemsHistory.indexWhere((element) => element.startsWith('$itemName:'));
//
//       if (index != -1) {
//         // Remove the item from history
//         sentItemsHistory.removeAt(index);
//
//         // If the history list is empty after removing the item, you might want to remove the orderId from the map
//         if (sentItemsHistory.isEmpty) {
//           _orderSentItemsHistory.remove(orderId);
//         }
//       }
//     });
//   }
// }
//
// class Counter {
//   int value;
//
//   Counter({this.value = 1});
//
//   void increment() {
//     value++;
//   }
//
//   void decrement() {
//     value--;
//   }
// }
import 'package:flutter/cupertino.dart';

class ItemViewViewModel with ChangeNotifier {
  List<int?> _id = [];
  List<int?> get id => _id;
  List<List<int>> _savedid = [];
  List<List<int>> get savedid => _savedid;
  String? _selectFloor = 'Select Floor';
  String? get selectFloor => _selectFloor;
  String? _selectedFloor;
  String? get selectedFloor => _selectedFloor;
  String? _selectedItem;
  String? get selectedItem => _selectedItem;
  List<int?> _list = [];
  List<int?> get list => _list;
  List<Map<dynamic, String>> _item = [];
  List<Map<dynamic, String>> get item => _item;
  Map<int, List<String>> _orderSentItemsHistory = {};
  Map<int, List<String>> get orderSentItemsHistory => _orderSentItemsHistory;
  void generate(int id) {
    _savedid = List<List<int>>.generate(id, (index) => []);
    _savedItem = List<List<String>>.generate(id, (index) => []);
    counters = List.generate(
      id,
      (index) => List<Counter>.generate(100, (innerIndex) => Counter()),
    );
    print('generated${counters.length}');

    _dropDownIList = List.generate(
      id,
      (index) => ['Select Item'],
    );
  }

  set selectedItem(String? value) {
    _selectedFloor = value;
    notifyListeners();
  }

  void addlist(int index) {
    _list = _savedid[index];
    notifyListeners();
  }

  void getid(int Id) {
    _id.add(Id);
  }

  void getsavedid(int Id, int index) {
    if (_savedid[index].contains(Id)) {
    } else
    {
      _savedid[index].add(Id);
      notifyListeners();
    }
  }
  void getsavedid2(int Id, int index) {

      _savedid[index].add(Id);
      notifyListeners();

  }

  String? SelectedFloor(value) {
    _selectFloor = value;
    notifyListeners();
    return _selectedFloor;
  }

  List<List<Counter>> counters = [];
  List<String> _dropDownIList2 = ['Select Floor'];
  List<String> get dropDownIList2 => _dropDownIList2;
  int _counter = 1;
  int get counter => _counter;
  List<List<String>> _dropDownIList = [];
  List<List<String>> get dropDownIList => _dropDownIList;
  List<List<String>> _savedItem = [];
  List<List<String>> get savedItem => _savedItem;
  void getFloor(String item) {
    if (dropDownIList2.contains(item)) {
    } else {
      dropDownIList2.add(item);
    }
  }

  void getItem(String item, index) {
    if (dropDownIList[index].contains(item)) {
    } else {
      dropDownIList[index].add(item);
    }
  }

  List<String> passFloor() {
    notifyListeners();
    return _dropDownIList2;
  }

  List<String> passitem(int index) {
    notifyListeners();
    return _dropDownIList[index];
  }

  void clear(int index) {
    _id = [];
    _savedid[index] = [];
    _savedItem[index] = [];
  }

  void saveitem(String item, index) {
    if (item == 'Select Item' || _savedItem[index].contains(item)) {
    } else {
      _savedItem[index].add(item);
      _savedItem[index].reversed;
    }
    notifyListeners();
  }

  // List<String> removeitem(int index) {
  //   _savedItem.removeAt(index);
  //   notifyListeners();
  //   return _savedItem;
  // }
  void removeitem(int index, int index1) {
    _savedItem[index1].removeAt(index);
    _savedid[index1].removeAt(index);
    notifyListeners();
  }

  void removeItem() {
    _dropDownIList = [];
  }

  void GetCounter(int index, index1, value) {
    counters[index1][index].getCounter(value);
    notifyListeners();
  }

  void incrementCounter(int index, index1) {
    counters[index1][index].increment();
    notifyListeners();
  }

  void decerementCounter(int index, index1) {
    counters[index1][index].decrement();
    notifyListeners();
  }

  void storeSentItemsHistoryForOrder(int orderId) {
    if (!_orderSentItemsHistory.containsKey(orderId)) {
      _orderSentItemsHistory[orderId] = [];
    }

    List<String> sentItemsHistory = _orderSentItemsHistory[orderId]!;
    for (int i = 0; i < _savedItem[orderId].length; i++) {
      String item = _savedItem[orderId][i];
      int quantity = counters[orderId][i].value;
      int index = sentItemsHistory
          .indexWhere((element) => element.startsWith('$item:'));
      if (index != -1) {
        sentItemsHistory[index] = '$item:$quantity';
      } else {
        sentItemsHistory.add('$item:$quantity');
      }
    }
  }

  Map<String, dynamic> getExtraQuantitiesForOrder(int orderId, id, itemm) {
    Map<String, dynamic> extraQuantities = {};

    if (_orderSentItemsHistory.containsKey(orderId)) {
      List<String> sentItemsHistory = _orderSentItemsHistory[orderId]!;

      String item = itemm['name'];
      int quantity = int.parse(itemm['quantity']);
      print(quantity);
      // Check if the item is in the sent items history
      int index = sentItemsHistory
          .indexWhere((element) => element.startsWith('$item:'));

      if (index != -1) {
        // Extract the quantity from the history entry
        int historyQuantity = int.parse(sentItemsHistory[index].split(':')[1]);
        if (quantity > historyQuantity) {
          int extraQuantity = quantity - historyQuantity;
          extraQuantities = {
            'item': item,
            'quantity': extraQuantity.toString(),
            "id": id,
            "tab": "Living",
            "type": "house_removal",
            "parent": "498",
            "parent_name": ""
          };
        }
      } else {
        extraQuantities = {
          'item': item,
          'quantity': quantity.toString(),
          "id": id,
          "tab": "Living",
          "type": "house_removal",
          "parent": "498",
          "parent_name": ""
          // Add other necessary properties...
        };
      }
    }
    return extraQuantities;
  }

  void deleteItemHistory(String itemName) {
    _orderSentItemsHistory.forEach((orderId, sentItemsHistory) {
      int index = sentItemsHistory
          .indexWhere((element) => element.startsWith('$itemName:'));

      if (index != -1) {
        // Remove the item from history
        sentItemsHistory.removeAt(index);

        // If the history list is empty after removing the item, you might want to remove the orderId from the map
        if (sentItemsHistory.isEmpty) {
          _orderSentItemsHistory.remove(orderId);
        }
      }
    });
  }
}

class Counter {
  int value;

  Counter({this.value = 1});

  void increment() {
    value++;
  }

  void getCounter(int i) {
    value = i;
  }

  void decrement() {
    value--;
  }
}
