// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/floor_repo.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/updateItemRepo.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';
import '../view_model/ExtraItemFloorViewModel.dart';
import '../view_model/auth_view_model.dart';

class Extra_Items_View extends StatefulWidget {
  @override
  State<Extra_Items_View> createState() => _Extra_Items_ViewState();
  dispose() {}
}

UpdateItemRepo up = UpdateItemRepo();
late String _selectedFloor;
List<int> save = [];

class _Extra_Items_ViewState extends State<Extra_Items_View> {
  final FocusNode _focusNode = FocusNode();
  String selectedOption = '';
  final String _selectedItem = 'Dismantling Service';
  final String _rselectedItem = 'Reassembly Service';
  final String _pselectedItem = 'Packing Service';
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
  Widget build(BuildContext context) {
    UpdateItemRepo up = UpdateItemRepo();
    final item = Provider.of<ItemViewViewModel>(context, listen: true);
    final it = Provider.of<ExtraItemViewViewModel>(context);
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
              'Add Extra Services',
              style: TextStyle(
                  color: BC.white,
                  fontSize: width * 0.067,
                  fontFamily: "HelveticaBold"),
            ),
            centerTitle: true,
          ),
          body: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BC.lightGrey),
                            ),
                            child: Consumer<ExtraItemViewViewModel>(
                                builder: (context, ItemModel, child) {
                              return FutureBuilder(
                                future: floorAndItemRepo.GetItemsDetails(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData) {
                                    for (int i = 0;
                                        i < snapshot.data['items'].length;
                                        i++) {
                                      ItemModel.getid(int.parse(snapshot
                                          .data['items'][i]['product_id']));
                                      ItemModel.getItem(snapshot.data['items']
                                              [i]['name']
                                          .toString());
                                    }
                                    return DropdownButton(
                                      focusNode: _focusNode,
                                      borderRadius: BorderRadius.circular(10),
                                      isExpanded: true,
                                      hint: const Text('Dismantling Service'),
                                      underline: const SizedBox(),
                                      icon: const Icon(
                                        Icons.search,
                                      ),
                                      value: ItemModel.dselectedItem ??
                                          _selectedItem,
                                      onChanged: (value) {
                                        if (value != 'Dismantling Service') {
                                          ItemModel.ddropDownIList
                                              .contains(value);
                                          ItemModel.dsaveitem(value.toString());
                                          for (int i = 0;
                                              i < ItemModel.dsavedItem.length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .ddropDownIList.length;
                                                j++) {
                                              if (ItemModel.ddropDownIList[j]
                                                  .contains(ItemModel
                                                      .dsavedItem[i])) {
                                                ItemModel.getsavedid(j);
                                              }
                                            }
                                          }
                                        }
                                        _focusNode.unfocus();
                                      },
                                      items:
                                          ItemModel.ddropDownIList.map((item) {
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
                                    hint: const Text('Dismantling Service'),
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
                          it.dsavedItem.isNotEmpty
                              ? Consumer<ExtraItemViewViewModel>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      'Additional Items (${value.dsavedItem.length})',
                                      style: TextStyle(
                                        fontSize: width * 0.048,
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox(),
                          Consumer<ExtraItemViewViewModel>(
                              builder: (context, value, child) {
                            return FutureBuilder(
                              future: floorAndItemRepo.GetItemsDetails(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasData) {
                                  return it.dsavedItem.isNotEmpty
                                      ? SizedBox(
                                          height: height *
                                              value.dsavedItem.length *
                                              0.1,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value.dsavedItem.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffEBEBEB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.46,
                                                          child: Text(
                                                            value.dsavedItem[
                                                                index],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.048,
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: BC.blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (value
                                                                          .Dcounters[
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decerementDCounter(
                                                                        index);
                                                                  }
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  size: 20,
                                                                  color:
                                                                      BC.white,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              value
                                                                  .Dcounters[
                                                                      index]
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "HelveticaRegular",
                                                                  fontSize:
                                                                      width *
                                                                          0.045),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      BC.blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    value.incrementDCounter(
                                                                        index);
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    size: 20,
                                                                    color: BC
                                                                        .white,
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              dynamic data = value
                                                                  .dsavedItem;
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value
                                                                    .dremoveitem(
                                                                        index);
                                                              },
                                                              child: const Icon(
                                                                Icons.delete,
                                                                color: Color(
                                                                    0xffE10000),
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
                                        )
                                      : const SizedBox(
                                          height: 0.1,
                                        );
                                }
                                return const CircularProgressIndicator();
                              },
                            );
                          }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BC.lightGrey),
                            ),
                            child: Consumer<ExtraItemViewViewModel>(
                                builder: (context, ItemModel, child) {
                              return FutureBuilder(
                                future: floorAndItemRepo.GetItemsDetails(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData) {
                                    for (int i = 0;
                                        i < snapshot.data['items'].length;
                                        i++) {
                                      ItemModel.getrid(int.parse(snapshot
                                          .data['items'][i]['product_id']));
                                      ItemModel.getrItem(snapshot.data['items']
                                              [i]['name']
                                          .toString());
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
                                      value: ItemModel.rselectedItem ??
                                          _rselectedItem,
                                      onChanged: (value) {
                                        if (value != 'Reassembly Service') {
                                          ItemModel.rdropDownIList
                                              .contains(value);
                                          ItemModel.saveitem(value.toString());
                                          for (int i = 0;
                                              i < ItemModel.rsavedItem.length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .rdropDownIList.length;
                                                j++) {
                                              if (ItemModel.rdropDownIList[j]
                                                  .contains(ItemModel
                                                      .rsavedItem[i])) {
                                                ItemModel.getrsavedid(j);
                                              }
                                            }
                                          }
                                        }
                                        _focusNode.unfocus();
                                      },
                                      items:
                                          ItemModel.rdropDownIList.map((item) {
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
                                    hint: const Text('Reassembly Service'),
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
                          it.rsavedItem.isNotEmpty
                              ? Consumer<ExtraItemViewViewModel>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      'Additional Items (${value.rsavedItem.length})',
                                      style: TextStyle(
                                        fontSize: width * 0.048,
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox(),
                          Consumer<ExtraItemViewViewModel>(
                              builder: (context, value, child) {
                            print(value.rsavedid);
                            return FutureBuilder(
                              future: floorAndItemRepo.GetItemsDetails(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasData) {
                                  return it.rsavedItem.isNotEmpty
                                      ? SizedBox(
                                          height: height *
                                              value.rsavedItem.length *
                                              0.1,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value.rsavedItem.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffEBEBEB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.46,
                                                          child: Text(
                                                            value.rsavedItem[
                                                                index],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.048,
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: BC.blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (value
                                                                          .counters[
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decerementCounter(
                                                                        index);
                                                                  }
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  size: 20,
                                                                  color:
                                                                      BC.white,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              value
                                                                  .counters[
                                                                      index]
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "HelveticaRegular",
                                                                  fontSize:
                                                                      width *
                                                                          0.045),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      BC.blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    value.incrementCounter(
                                                                        index);
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    size: 20,
                                                                    color: BC
                                                                        .white,
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              dynamic data = value
                                                                  .rsavedItem;
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value
                                                                    .removeitem(
                                                                        index);
                                                              },
                                                              child: const Icon(
                                                                Icons.delete,
                                                                color: Color(
                                                                    0xffE10000),
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
                                        )
                                      : const SizedBox();
                                }
                                return const CircularProgressIndicator();
                              },
                            );
                          }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BC.lightGrey),
                            ),
                            child: Consumer<ExtraItemViewViewModel>(
                                builder: (context, ItemModel, child) {
                              return FutureBuilder(
                                future: floorAndItemRepo.GetItemsDetails(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData) {
                                    for (int i = 0;
                                        i < snapshot.data['items'].length;
                                        i++) {
                                      ItemModel.getpid(int.parse(snapshot
                                          .data['items'][i]['product_id']));
                                      ItemModel.getpItem(snapshot.data['items']
                                              [i]['name']
                                          .toString());
                                    }
                                    return DropdownButton(
                                      focusNode: _focusNode,
                                      borderRadius: BorderRadius.circular(10),
                                      isExpanded: true,
                                      hint: const Text('Packing Service'),
                                      underline: const SizedBox(),
                                      icon: const Icon(
                                        Icons.search,
                                      ),
                                      value: ItemModel.pselectedItem ??
                                          _pselectedItem,
                                      onChanged: (value) {
                                        if (value != 'Packing Service') {
                                          ItemModel.pdropDownIList
                                              .contains(value);
                                          ItemModel.savepitem(value.toString());
                                          for (int i = 0;
                                              i < ItemModel.psavedItem.length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .pdropDownIList.length;
                                                j++) {
                                              if (ItemModel.pdropDownIList[j]
                                                  .contains(ItemModel
                                                      .psavedItem[i])) {
                                                ItemModel.getpsavedid(j);
                                              }
                                            }
                                          }
                                        }
                                        _focusNode.unfocus();
                                      },
                                      items:
                                          ItemModel.rdropDownIList.map((item) {
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
                                    hint: const Text('Packing Service'),
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
                          it.psavedItem.isNotEmpty
                              ? Consumer<ExtraItemViewViewModel>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      'Additional Items (${value.psavedItem.length})',
                                      style: TextStyle(
                                        fontSize: width * 0.048,
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer<ExtraItemViewViewModel>(
                              builder: (context, value, child) {
                            return FutureBuilder(
                              future: floorAndItemRepo.GetItemsDetails(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasData) {
                                  return it.psavedItem.isNotEmpty
                                      ? SizedBox(
                                          height: height *
                                              value.psavedItem.length *
                                              0.1,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value.psavedItem.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffEBEBEB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.46,
                                                          child: Text(
                                                            value.psavedItem[
                                                                index],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.048,
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: BC.blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (value
                                                                          .pcounters[
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decerementPCounter(
                                                                        index);
                                                                  }
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  size: 20,
                                                                  color:
                                                                      BC.white,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              value
                                                                  .pcounters[
                                                                      index]
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "HelveticaRegular",
                                                                  fontSize:
                                                                      width *
                                                                          0.045),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      BC.blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    value.incrementPCounter(
                                                                        index);
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    size: 20,
                                                                    color: BC
                                                                        .white,
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              dynamic data = value
                                                                  .psavedItem;
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value
                                                                    .removepitem(
                                                                        index);
                                                              },
                                                              child: const Icon(
                                                                Icons.delete,
                                                                color: Color(
                                                                    0xffE10000),
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
                                        )
                                      : const SizedBox();
                                }
                                return const CircularProgressIndicator();
                              },
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Center(
                    child: Consumer<AuthViewModelProvider>(
                        builder: (context, value, child) {
                      return Rounded_Button2(
                          width: width * 0.9,
                          height: height * 1,
                          title: "DONE",
                          onPress: () async {
                            it.saveallid();

                            save.addAll(it.rsavedid);

                            save.addAll(it.psavedid);
                            print(item.savedid);
                            save.addAll(it.dismantlesavedid);
                            for (int i = 0; i < save.length; i++) {
                              item.getsavedid(save[i]);
                            }
                            print(item.savedid);
                            // print(it.allid);
                            SharedPreferences sp =
                                await SharedPreferences.getInstance();

                            List<Map<String, dynamic>> updateItem = [];
                            if (it.rsavedItem.isNotEmpty ||
                                it.dsavedItem.isNotEmpty ||
                                it.psavedItem.isNotEmpty) {
                              if (it.rsavedid.isNotEmpty) {
                                for (int i = 0; i < it.rsavedid.length; i++) {
                                  item.getsavedid(it.rsavedid[i]);
                                }
                                for (int i = 0; i < it.rsavedItem.length; i++) {
                                  Map<String, dynamic> item = {
                                    "name": it.rsavedItem[i],
                                    "id": it.rsavedid[i],
                                    "quantity": it.counters[i].value.toString(),
                                    "tab": "Living",
                                    "type": "Reassembly Service",
                                    "parent": "498",
                                    "parent_name": ""
                                  };
                                  updateItem.add(item);
                                }
                              }

                              if (it.dsavedItem.isNotEmpty) {
                                for (int i = 0;
                                    i < it.dismantlesavedid.length;
                                    i++) {
                                  item.getsavedid(it.dismantlesavedid[i]);
                                }
                                for (int i = 0; i < it.dsavedItem.length; i++) {
                                  Map<String, dynamic> item = {
                                    "name": it.dsavedItem[i],
                                    "id": it.dismantlesavedid[i],
                                    "quantity":
                                        it.Dcounters[i].value.toString(),
                                    "tab": "Living",
                                    "type": "Dismantling Service",
                                    "parent": "498",
                                    "parent_name": ""
                                  };
                                  updateItem.add(item);
                                }
                              }

                              if (it.psavedItem.isNotEmpty) {
                                for (int i = 0; i < it.psavedid.length; i++) {
                                  item.getsavedid(it.psavedid[i]);
                                }
                                for (int i = 0; i < it.psavedItem.length; i++) {
                                  Map<String, dynamic> item = {
                                    "name": it.psavedItem[i],
                                    "id": it.psavedid[i],
                                    "quantity":
                                        it.pcounters[i].value.toString(),
                                    "tab": "Living",
                                    "type": "Packing Service",
                                    "parent": "498",
                                    "parent_name": ""
                                  };
                                  updateItem.add(item);
                                }
                              }
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
                ),
              ],
            ),
          )),
    );
  }
}
