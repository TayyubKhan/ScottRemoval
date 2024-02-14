// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/floor_repo.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/updateItemRepo.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class Add_Items_View extends StatefulWidget {
  const Add_Items_View({super.key});

  @override
  State<Add_Items_View> createState() => _Add_Items_ViewState();
  dispose() {}
}

late String _selectedFloor;

class _Add_Items_ViewState extends State<Add_Items_View> {
  int id = 0;
  @override
  void initState() {
    super.initState();
    final it = Provider.of<ItemViewViewModel>(context, listen: false);
    final data = Provider.of<DataViewViewModel>(context, listen: false);
    it.clear(data.index);
  }

  // List<Map<String, dynamic>> dataList = [
  //   {
  //     'name': 'Three Seater Sofa',
  //     'quantity': '9',
  //     'id': '3',
  //     ' tab': ' Living',
  //     ' type': 'house_removal',
  //     'parent': '498',
  //     'parent_name': ''
  //   },
  //   {
  //     'name': 'Four Seater Sofa',
  //     'quantity': '5',
  //     'id': '104',
  //     'tab': 'Living',
  //     'type': 'house_removal',
  //     'parent': '498',
  //     'parent_name': ''
  //   },
  //   {
  //     'name': ' Electric Piano',
  //     'id': '839',
  //     'quantity': '1',
  //     'tab': 'Living',
  //     'type': ' house_removal',
  //     'parent': '498',
  //     'parent_name': ''
  //   }
  // ];
  bool add = true;
  bool loading = true;
  UpdateItemRepo up = UpdateItemRepo();
  final FocusNode _focusNode = FocusNode();
  String selectedOption = '';
  final String _selectedItem = 'Select Item';
  final List<String> _dropdownItems = [
    'Select Floor',
    '1st Floor ',
    '2nd Floor',
    '3rd Floor',
    '4rth Floor',
    '5th Floor',
  ];
  List<String> filteredOptions = [];
  List<dynamic> item = [];
  FloorAndItemRepo floorAndItemRepo = FloorAndItemRepo();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    UpdateItemRepo up = UpdateItemRepo();
    final it = Provider.of<ItemViewViewModel>(context, listen: false);
    final data = Provider.of<DataViewViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: height * 0.08,
            backgroundColor: BC.blue,
            leading: IconButton(
                onPressed: () {
                  // it.clear(data.index);
                  Navigator.pushReplacementNamed(
                      context, RoutesName.singleOrder);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: BC.white,
                )),
            title: Text(
              'Add Items',
              style: TextStyle(
                  color: BC.white,
                  fontSize: width * 0.067,
                  fontFamily: "HelveticaBold"),
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Please only add item which are not present on job sheet inventory',
                  style: TextStyle(
                    fontFamily: "HelveticaRegular",
                    color: Colors.black,
                    fontSize: width * 0.048,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: BC.lightGrey),
                    ),
                    child: FutureBuilder(
                      future: floorAndItemRepo.GetItemsDetails(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        item = [];
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          for (int k = 0; k < data.dataList.length; k++) {
                            it.saveitem(data.dataList[k]['name'].toString(),
                                data.index);
                            it.getsavedid2(
                                int.parse(data.dataList[k]['id'].toString()),
                                data.index);
                            it.GetCounter(
                                k,
                                data.index,
                                int.parse(
                                    data.dataList[k]['quantity'].toString()));
                          }
                        });
                        if (snapshot.hasData) {
                          loading = false;
                          return Consumer<ItemViewViewModel>(
                              builder: (context, ItemModel, child) {
                            item = snapshot.data['items'];
                            for (int i = 0;
                                i < snapshot.data['items'].length;
                                i++) {
                              ItemModel.getid(int.parse(
                                  snapshot.data['items'][i]['product_id']));
                              ItemModel.getItem(
                                  snapshot.data['items'][i]['name'].toString(),
                                  data.index);
                            }

                            return DropdownButton(
                              focusNode: _focusNode,
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                              hint: const Text('Search Items'),
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.search,
                              ),
                              value: ItemModel.selectedItem ?? _selectedItem,
                              onChanged: (value) {
                                if (value != 'Select Item') {
                                  ItemModel.dropDownIList[data.index]
                                      .contains(value);
                                  ItemModel.saveitem(
                                      value.toString(), data.index);
                                  for (int i = 0; i < item.length; i++) {
                                    if (item[i]["name"] == value) {
                                      ItemModel.getsavedid(
                                          int.parse(item[i]["product_id"]),
                                          data.index);
                                      break; // Stop searching once a match is found
                                    }
                                  }
                                }
                                _focusNode.unfocus();
                              },
                              items: ItemModel.dropDownIList[data.index]
                                  .map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            );
                          });
                        }
                        return DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          hint: const Text('Search Items'),
                          underline: const SizedBox(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: const [],
                          onChanged: (value) {},
                        );
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Consumer<ItemViewViewModel>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      'Additional Items (${value.savedItem[data.index].length})',
                      style: TextStyle(
                        fontSize: width * 0.048,
                        fontFamily: "HelveticaRegular",
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                loading
                    ? Consumer<ItemViewViewModel>(
                        builder: (context, value, child) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: value.savedItem[data.index].length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEBEBEB),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * 0.46,
                                          child: Text(
                                            value.savedItem[data.index][index],
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontFamily: "HelveticaRegular",
                                                color: Colors.black),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: BC.blue,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  if (value
                                                          .counters[data.index]
                                                              [index]
                                                          .value >=
                                                      2) {
                                                    value.decerementCounter(
                                                        index, data.index);
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                  color: BC.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.counters[data.index][index]
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      "HelveticaRegular",
                                                  fontSize: width * 0.045),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: BC.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    print(value
                                                        .counters[data.index]
                                                            [index]
                                                        .value
                                                        .toString());
                                                    value.incrementCounter(
                                                        index, data.index);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: BC.white,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: (){},
                                          icon: InkWell(
                                              onTap: () {
                                                value.removeitem(
                                                    index, data.index);
                                                it.GetCounter(
                                                    index, data.index, 1);

                                              },
                                              child: const Image(
                                                height: 20,
                                                image: AssetImage(
                                                    'assets/delete.png'),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      })
                    : const Center(
                        child: CircularProgressIndicator(
                          color: BC.blue,
                        ),
                      ),
                Center(
                  child: Consumer<AuthViewModelProvider>(
                      builder: (context, value, child) {
                    return Rounded_Button2(
                        width: width * 0.9,
                        height: height * 1,
                        loading: value.loading,
                        title: "DONE",
                        onPress: () async {
                          print(data.dataList);
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          value.setLoading(true);
                          if (it.savedItem[data.index].isNotEmpty) {
                            List<Map<String, dynamic>> updateItem = [];
                            for (int i = 0; i < item.length; i++) {
                              for (int j = 0;
                                  j < it.savedItem[data.index].length;
                                  j++) {
                                if (item[i]["product_id"].toString() ==
                                    it.savedid[data.index][j].toString()) {
                                  Map<String, dynamic> itemm = {};
                                  if (it.orderSentItemsHistory
                                      .containsKey(data.index)) {
                                    List<String> sentItemsHistory =
                                        it.orderSentItemsHistory[data.index]!;
                                    String name = it.savedItem[data.index][j];
                                    int quantity =
                                        it.counters[data.index][j].value;
                                    int index = sentItemsHistory.indexWhere(
                                        (element) =>
                                            element.startsWith('$name:'));
                                    if (index != -1) {
                                      int historyQuantity = int.parse(
                                          sentItemsHistory[index]
                                              .split(':')[1]);
                                      if (historyQuantity < quantity) {
                                        int extraQuantity =
                                            quantity - historyQuantity;
                                        itemm = {
                                          'name': name,
                                          'quantity': extraQuantity.toString(),
                                          "id": item[i]["product_id"],
                                          "tab": "Living",
                                          "type": "house_removal",
                                          "parent": "498",
                                          "parent_name": ""
                                        };
                                      } else if (historyQuantity == quantity) {
                                        itemm = {};
                                      } else {
                                        itemm = {
                                          'name': it.savedItem[data.index][j],
                                          'quantity': it
                                              .counters[data.index][j].value
                                              .toString(),
                                          "id": item[i]["product_id"],
                                          "tab": "Living",
                                          "type": "house_removal",
                                          "parent": "498",
                                          "parent_name": ""
                                        };
                                      }
                                    } else {
                                      itemm = {
                                        'name': it.savedItem[data.index][j],
                                        'quantity': it
                                            .counters[data.index][j].value
                                            .toString(),
                                        "id": item[i]["product_id"],
                                        "tab": "Living",
                                        "type": "house_removal",
                                        "parent": "498",
                                        "parent_name": ""
                                      };
                                    }
                                  } else {
                                    itemm = {
                                      'name': it.savedItem[data.index][j],
                                      'quantity': it
                                          .counters[data.index][j].value
                                          .toString(),
                                      "id": item[i]["product_id"],
                                      "tab": "Living",
                                      "type": "house_removal",
                                      "parent": "498",
                                      "parent_name": ""
                                    };
                                  }
                                  updateItem.add(itemm);
                                }
                                // Stop searching once a match is found
                              }
                            }
                            it.addlist(data.index);
                            value.setLoading(true);
                            await up.UpdateItemAPI(context,
                                sp.get('orderId').toString(), updateItem);
                            value.setLoading(false);
                            Navigator.pushReplacementNamed(
                                context, RoutesName.singleOrder);
                            Utilis.submitted_flushbar_message(
                                context, 'Success');
                          } else {
                            Utilis.error_flushbar_message(context, 'Error');
                          }
                        });
                  }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
