import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/floor_repo.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/updateItemRepo.dart';
import '../res/colors.dart';

class Add_Items_View extends StatefulWidget {
  @override
  State<Add_Items_View> createState() => _Add_Items_ViewState();
  dispose() {}
}

late String _selectedFloor;

class _Add_Items_ViewState extends State<Add_Items_View> {
  void initState() {
    super.initState();
    _selectedFloor = 'Select Item';
  }

  FocusNode _focusNode = FocusNode();
  String selectedOption = '';
  String _selectedItem = 'Select Item';
  List<String> _dropdownItems = [
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
  Widget build(BuildContext context) {
    UpdateItemRepo up = UpdateItemRepo();
    final it = Provider.of<ItemViewViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.08,
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                child: Consumer<ItemViewViewModel>(
                    builder: (context, ItemModel, child) {
                  return FutureBuilder(
                    future: floorAndItemRepo.GetItemsDetails(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        for (int i = 0;
                            i < snapshot.data['items'].length;
                            i++) {
                          ItemModel.getid(int.parse(
                              snapshot.data['items'][i]['product_id']));
                          ItemModel.getItem(
                              snapshot.data['items'][i]['name'].toString());
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
                            ItemModel.dropDownIList.contains(value);
                            ItemModel.saveitem(value.toString());
                            for (int i = 0;
                                i < ItemModel.savedItem.length;
                                i++) {
                              for (int j = 0;
                                  j < ItemModel.dropDownIList.length;
                                  j++) {
                                if (ItemModel.dropDownIList[j]
                                    .contains(ItemModel.savedItem[i])) {
                                  ItemModel.getsavedid(j);
                                  print(ItemModel.savedid);
                                }
                              }
                            }
                            _focusNode.unfocus();
                          },
                          items: ItemModel.dropDownIList.map((item) {
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
                        items: [],
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
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        value.savedItem[index],
                                        style: TextStyle(
                                            fontSize: width * 0.048,
                                            fontFamily: "HelveticaRegular",
                                            color: Colors.black),
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
                                                value.decerementCounter(index);
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
                                                fontFamily: "HelveticaRegular",
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
                                                  value.incrementCounter(index);
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
              const Spacer(),
              Center(
                child: Rounded_Button2(
                    width: width * 0.9,
                    height: height * 1,
                    title: "DONE",
                    onPress: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      if (it.savedItem.length == 0) {
                        String itemname = '';
                        dynamic updateItem = [];
                        for (int i = 0; i < it.savedItem.length; i++) {
                          updateItem[{
                            "name": it.savedItem[i],
                            "id": it.savedid[i],
                            "quantity": it.counters[i],
                            "tab": "Living",
                            "type": "house_removal",
                            "parent": "498",
                            "parent_name": ""
                          }];
                        }
                        dynamic data = jsonEncode(updateItem);
                        up.UpdateItemAPI(
                            context, sp.get('id').toString(), data);
                        Utilis.error_flushbar_message(
                            context, 'Please Add Items');
                      } else {
                        Utilis.submitted_flushbar_message(
                            context, 'Items Updated');
                        Navigator.pushNamed(context, RoutesName.addFloors);
                      }
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
