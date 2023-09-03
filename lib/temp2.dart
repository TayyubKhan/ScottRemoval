// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/floor_repo.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/temprovider.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/updateItemRepo.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
  dispose() {}
}

late String _selectedFloor;

class _TempState extends State<Temp> {
  int id = 0;
  @override
  void initState() {
    super.initState();
    _selectedFloor = 'Select Item';
  }

  bool add = false;
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
  FloorAndItemRepo floorAndItemRepo = FloorAndItemRepo();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    UpdateItemRepo up = UpdateItemRepo();
    final it = Provider.of<ItemViewViewModel>(context, listen: true);
    final data = Provider.of<DataViewViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: height * 0.08,
            backgroundColor: BC.blue,
            leading: IconButton(
                onPressed: () {
                  it.clear();
                  Navigator.pushNamed(context, RoutesName.singleOrder);
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
                  child:
                      Consumer<TempProvider>(builder: (context, model, child) {
                    return FutureBuilder(
                      future: floorAndItemRepo.GetItemsDetails(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          model.clear();
                          model.getData(snapshot.data['items'] as dynamic);
                          log(model.data[0]['name'].toString());
                          for (int i = 0; i < model.data.length; i++) {
                            if (model.name.contains(model.data[i]['name'])) {
                              log('${'Name :' + model.data[i]['name']}Product Id=' +
                                  model.data[i]['product_id']);
                            }
                            model.getName(model.data[i]['name'].toString());
                          }
                          log('Name:${model.name.length}');
                          log(model.data.length.toString());
                          log(model.data[0].toString());
                          // for (int i = 0;
                          // i < snapshot.data['items'].length;
                          // i++) {
                          //   model.getid(int.parse(
                          //       snapshot.data['items'][i]['product_id']));
                          //   model.getItem(
                          //       snapshot.data['items'][i]['name'].toString());
                          // }
                          return DropdownButton(
                            focusNode: _focusNode,
                            borderRadius: BorderRadius.circular(10),
                            isExpanded: true,
                            hint: const Text('Search Items'),
                            underline: const SizedBox(),
                            icon: const Icon(
                              Icons.search,
                            ),
                            value: model.selectedItem ?? _selectedItem,
                            onChanged: (value) {
                              if (value != 'Select Item') {}
                            },
                            // {
                            //   if (value != 'Select Item') {
                            //     model.dropDownIList.contains(value);
                            //     model.saveitem(value.toString());
                            //     for (int i = 0;
                            //         i < model.savedItem.length;
                            //         i++) {
                            //       for (int j = 0;
                            //           j < model.dropDownIList.length;
                            //           j++) {
                            //         if (model.dropDownIList[j]
                            //             .contains(model.savedItem[i])) {
                            //           print('id' + j.toString());
                            //           model.getsavedid(j);
                            //         }
                            //       }
                            //     }
                            //   }
                            //   _focusNode.unfocus();
                            // },
                            items: model.name.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          );
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
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<ItemViewViewModel>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      'Additional Items (${value.savedItem.length})',
                      style: TextStyle(
                        fontSize: width * 0.048,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<ItemViewViewModel>(builder: (context, value, child) {
                  return FutureBuilder(
                    future: floorAndItemRepo.GetItemsDetails(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: value.savedItem.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEBEBEB),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * 0.46,
                                          child: Text(
                                            value.savedItem[index],
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
                                                  if (value.counters[index]
                                                          .value >=
                                                      2) {
                                                    value.decerementCounter(
                                                        index);
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
                                              value.counters[index].value
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
                                                    value.incrementCounter(
                                                        index);
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
                                            onPressed: () {
                                              dynamic data = value.savedItem;
                                            },
                                            icon: InkWell(
                                              onTap: () {
                                                value.removeitem(index);
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color(0xffE10000),
                                              ),
                                            ))
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
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                }),
                Center(
                  child: Consumer<AuthViewModelProvider>(
                      builder: (context, value, child) {
                    return Rounded_Button2(
                        width: width * 0.9,
                        height: height * 1,
                        loading: value.loading,
                        title: "DONE",
                        onPress: () async {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          value.setLoading(true);
                          if (it.savedItem.isNotEmpty) {
                            List<Map<String, dynamic>> updateItem = [];
                            for (int i = 0; i < it.savedItem.length; i++) {
                              Map<String, dynamic> item = {
                                "name": it.savedItem[i],
                                "id": it.savedid[i],
                                "quantity": it.counters[i].value.toString(),
                                "tab": "Living",
                                "type": "house_removal",
                                "parent": "498",
                                "parent_name": ""
                              };
                              for (int j = 0; j < data.dataList.length; j++) {
                                String id = data.dataList[j]['name'].toString();
                                if (it.savedItem[i] == id) {
                                  add = false;
                                  print(data.dataList[j]["quantity"]);
                                  int quantity = int.parse(
                                          it.counters[i].value.toString()) +
                                      int.parse(data.dataList[j]["quantity"]);
                                  data.dataList[j]["quantity"] =
                                      quantity.toString();
                                  print(data.dataList[j]["quantity"]);
                                  break;
                                } else {
                                  add = true;
                                  continue;
                                }
                              }
                              if (add == true) {
                                updateItem.add(item);
                              }
                            }
                            print(data.dataList);
                            updateItem.addAll(data.dataList);
                            it.addlist();
                            value.setLoading(true);
                            await up.UpdateItemAPI(context,
                                sp.get('orderId').toString(), updateItem);
                            value.setLoading(false);
                            Navigator.pushNamed(
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
