// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/res/app_url.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/ExtraItemFloorViewModel.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/ExtraItemsRepo.dart';
import '../repository/updateItemRepo.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class Extra_Items_View extends StatefulWidget {
  const Extra_Items_View({super.key});

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
  bool add = true;
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
  List<Map<String, dynamic>> dataList = [
    {
      'name': 'Bed',
      'quantity': '1',
      'id': '1',
      'tab': 'Living',
      'type': 'house_removal',
      'parent': 498,
      'parent_name': ''
    }
  ];
  List<dynamic> ditem = [];
  List<dynamic> ritem = [];
  List<dynamic> pitem = [];

  List<String> filteredOptions = [];
  int id = 0;
  ExtraItemRepo extraItemApi = ExtraItemRepo();
  @override
  bool get wantKeepAlive => true;
  bool loading = true;
  Widget build(BuildContext context) {
    UpdateItemRepo up = UpdateItemRepo();
    final item = Provider.of<ItemViewViewModel>(context, listen: true);
    final data = Provider.of<DataViewViewModel>(context, listen: true);
    final it = Provider.of<ExtraItemViewViewModel>(context);
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
                  // it.clear();
                  Navigator.pushReplacementNamed(
                      context, RoutesName.singleOrder);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: BC.white,
                )),
            title: Text(
              'Add Extra Services',
              style: TextStyle(
                  color: BC.white,
                  fontSize: width * 0.06,
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
                            child: FutureBuilder(
                              future: extraItemApi
                                  .getExtraItemRepo(AppUrl.dismantle),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                ditem = [];
                                if (snapshot.hasData) {
                                  loading = false;
                                  return Consumer<ExtraItemViewViewModel>(
                                      builder: (context, ItemModel, child) {
                                    ditem = snapshot.data['data'];
                                    for (int i = 0;
                                        i < snapshot.data['data'].length;
                                        i++) {
                                      ItemModel.getid(
                                          int.parse(
                                              snapshot.data['data'][i]['id']),
                                          data.index);
                                      ItemModel.getItem(snapshot.data['data'][i]
                                              ['name']
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
                                          ItemModel.dsaveitem(
                                              value.toString(), data.index);
                                          for (int i = 0;
                                              i <
                                                  ItemModel
                                                      .dsavedItem[data.index]
                                                      .length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .ddropDownIList.length;
                                                j++) {
                                              if (ItemModel.ddropDownIList[j]
                                                  .contains(
                                                      ItemModel.dsavedItem[
                                                          data.index][i])) {
                                                ItemModel.getsavedid(
                                                    j, data.index);
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
                                  });
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
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: it.dsavedItem[data.index].isNotEmpty,
                            child: Consumer<ExtraItemViewViewModel>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Text(
                                  'Additional Items (${value.dsavedItem[data.index].length})',
                                  style: TextStyle(
                                    fontSize: width * 0.048,
                                  ),
                                );
                              },
                            ),
                          ),
                          FutureBuilder(
                            future:
                                extraItemApi.getExtraItemRepo(AppUrl.dismantle),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return it.dsavedItem[data.index].isNotEmpty
                                    ? Consumer<ExtraItemViewViewModel>(
                                        builder: (context, value, child) {
                                        return SizedBox(
                                          height: height *
                                              value.dsavedItem[data.index]
                                                  .length *
                                              0.12,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value
                                                .dsavedItem[data.index].length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
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
                                                                    data.index]
                                                                [index],
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
                                                                              data.index]
                                                                              [
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decrementDCounter(
                                                                        data.index,
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
                                                                      data.index]
                                                                      [index]
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
                                                                        data.index,
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
                                                              dynamic dataa =
                                                                  value.dsavedItem[
                                                                      data.index];
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value.dremoveitem(
                                                                    index,
                                                                    data.index);
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
                                        );
                                      })
                                    : const SizedBox(
                                        height: 0.1,
                                      );
                              }
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: BC.blue,
                              ));
                            },
                          ),
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
                            child: FutureBuilder(
                              future: extraItemApi
                                  .getExtraItemRepo(AppUrl.assembly),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                ritem = [];
                                if (snapshot.hasData) {
                                  return Consumer<ExtraItemViewViewModel>(
                                      builder: (context, ItemModel, child) {
                                    ritem = snapshot.data['data'];
                                    for (int i = 0;
                                        i < snapshot.data['data'].length;
                                        i++) {
                                      ItemModel.getrid(
                                          int.parse(
                                              snapshot.data['data'][i]['id']),
                                          data.index);
                                      ItemModel.getrItem(snapshot.data['data']
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
                                          ItemModel.saveitem(
                                              value.toString(), data.index);
                                          for (int i = 0;
                                              i <
                                                  ItemModel
                                                      .rsavedItem[data.index]
                                                      .length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .rdropDownIList.length;
                                                j++) {
                                              if (ItemModel.rdropDownIList[j]
                                                  .contains(
                                                      ItemModel.rsavedItem[
                                                          data.index][i])) {
                                                ItemModel.getrsavedid(
                                                    j, data.index);
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
                                  });
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
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: it.rsavedItem[data.index].isNotEmpty,
                            child: Consumer<ExtraItemViewViewModel>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Text(
                                  'Additional Items (${value.rsavedItem[data.index].length})',
                                  style: TextStyle(
                                    fontSize: width * 0.048,
                                  ),
                                );
                              },
                            ),
                          ),
                          FutureBuilder(
                            future:
                                extraItemApi.getExtraItemRepo(AppUrl.assembly),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return it.rsavedItem[data.index].isNotEmpty
                                    ? Consumer<ExtraItemViewViewModel>(
                                        builder: (context, value, child) {
                                        return SizedBox(
                                          height: height *
                                              value.rsavedItem[data.index]
                                                  .length *
                                              0.13,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value
                                                .rsavedItem[data.index].length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
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
                                                                    data.index]
                                                                [index],
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
                                                                              data.index]
                                                                              [
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decrementCounter(
                                                                        data.index,
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
                                                                      data.index]
                                                                      [index]
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
                                                                        data.index,
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
                                                              dynamic dataa =
                                                                  value.rsavedItem[
                                                                      data.index];
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value.removeitem(
                                                                    index,
                                                                    data.index);
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
                                        );
                                      })
                                    : const SizedBox();
                              }
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: BC.blue,
                              ));
                            },
                          )
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
                            child: FutureBuilder(
                              future:
                                  extraItemApi.getExtraItemRepo(AppUrl.packing),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                pitem = [];
                                if (snapshot.hasData) {
                                  return Consumer<ExtraItemViewViewModel>(
                                      builder: (context, ItemModel, child) {
                                    pitem = snapshot.data['data'];
                                    for (int i = 0;
                                        i < snapshot.data['data'].length;
                                        i++) {
                                      ItemModel.getpid(
                                          int.parse(
                                              snapshot.data['data'][i]['id']),
                                          data.index);
                                      ItemModel.getpItem(snapshot.data['data']
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
                                          'Packing Service',
                                      onChanged: (value) {
                                        if (value != 'Packing Service') {
                                          ItemModel.pdropDownIList
                                              .contains(value);
                                          ItemModel.savepitem(
                                              value.toString(), data.index);
                                          for (int i = 0;
                                              i <
                                                  ItemModel
                                                      .psavedItem[data.index]
                                                      .length;
                                              i++) {
                                            for (int j = 0;
                                                j <
                                                    ItemModel
                                                        .pdropDownIList.length;
                                                j++) {
                                              if (ItemModel.pdropDownIList[j]
                                                  .contains(
                                                      ItemModel.psavedItem[
                                                          data.index][i])) {
                                                ItemModel.getpsavedid(
                                                    j, data.index);
                                              }
                                            }
                                          }
                                        }
                                        _focusNode.unfocus();
                                      },
                                      items:
                                          ItemModel.pdropDownIList.map((item) {
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
                                  hint: const Text('Packing Service'),
                                  underline: const SizedBox(),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                  items: const [],
                                  onChanged: (value) {},
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          it.psavedItem[data.index].isNotEmpty
                              ? Consumer<ExtraItemViewViewModel>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      'Additional Items (${value.psavedItem[data.index].length})',
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
                          FutureBuilder(
                            future:
                                extraItemApi.getExtraItemRepo(AppUrl.packing),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return it.psavedItem[data.index].isNotEmpty
                                    ? Consumer<ExtraItemViewViewModel>(
                                        builder: (context, value, child) {
                                        return SizedBox(
                                          height: height *
                                              value.psavedItem[data.index]
                                                  .length *
                                              0.13,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: value
                                                .psavedItem[data.index].length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
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
                                                                    data.index]
                                                                [index],
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
                                                                              data.index]
                                                                              [
                                                                              index]
                                                                          .value >=
                                                                      2) {
                                                                    value.decrementPCounter(
                                                                        data.index,
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
                                                                      data.index]
                                                                      [index]
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
                                                                        data.index,
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
                                                              dynamic dataa =
                                                                  value.psavedItem[
                                                                      data.index];
                                                            },
                                                            icon: InkWell(
                                                              onTap: () {
                                                                value.removepitem(
                                                                    index,
                                                                    data.index);
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
                                        );
                                      })
                                    : const SizedBox();
                              }
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: BC.blue,
                              ));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.1,
                      )
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
                          loading: value.loading,
                          onPress: () async {
                            print(it.dismantlesavedid);
                            List<Map<String, dynamic>> updateItem = [];
                            final sp = await SharedPreferences.getInstance();
                            void processDropdownItems(
                              List<String> savedItems,
                              List<int> savedIds,
                              List<dynamic> counters,
                              String itemType,
                              String type,
                            ) {
                              for (int i = 0; i < savedIds.length; i++) {
                                item.getsavedid(savedIds[i], data.index);
                              }
                              for (int i = 0; i < savedItems.length; i++) {
                                Map<String, dynamic> itemm = {};
                                String name = savedItems[i];
                                int quantity = counters[i].value;
                                if (it.orderSentItemsHistory.isNotEmpty) {
                                  List<String>? sentItemsHistory =
                                      it.orderSentItemsHistory[data.index];
                                  if (sentItemsHistory != null) {
                                    int index = sentItemsHistory.indexWhere(
                                        (element) =>
                                            element.startsWith('$name:'));
                                    if (index != -1) {
                                      int historyQuantity = int.parse(
                                          sentItemsHistory[index]
                                              .split(':')[1]);
                                      if (historyQuantity < quantity) {
                                        itemm = {
                                          'name': name,
                                          'quantity':
                                              (quantity - historyQuantity)
                                                  .toString(),
                                          "id": savedIds[i],
                                          "tab": "Living",
                                          "type": type,
                                          "parent": "498",
                                          "parent_name": "",
                                        };
                                      } else if (historyQuantity == quantity) {
                                        itemm = {};
                                      } else {
                                        itemm = {
                                          'name': savedItems[i],
                                          'quantity': quantity.toString(),
                                          "id": savedIds[i],
                                          "tab": "Living",
                                          "type": type,
                                          "parent": "498",
                                          "parent_name": "",
                                        };
                                      }
                                    } else {
                                      itemm = {
                                        'name': savedItems[i],
                                        'quantity': quantity.toString(),
                                        "id": savedIds[i],
                                        "tab": "Living",
                                        "type": type,
                                        "parent": "498",
                                        "parent_name": "",
                                      };
                                    }
                                  }
                                } else {
                                  itemm = {
                                    'name': savedItems[i],
                                    'quantity': quantity.toString(),
                                    "id": savedIds[i],
                                    "tab": "Living",
                                    "type": type,
                                    "parent": "498",
                                    "parent_name": "",
                                  };
                                }
                                if (itemm.isNotEmpty) {
                                  for (int k = 0;
                                      k < data.dataList.length;
                                      k++) {
                                    String id =
                                        data.dataList[k]['name'].toString();

                                    if (itemm['name'] == id) {
                                      add = false;
                                      int quantity =
                                          int.parse(itemm['quantity']) +
                                              int.parse(
                                                  data.dataList[k]["quantity"]);
                                      data.dataList[k]["quantity"] =
                                          quantity.toString();
                                      break;
                                    } else {
                                      add = true;
                                      continue;
                                    }
                                  }
                                  if (add == true && itemm.isNotEmpty) {
                                    updateItem.add(itemm);
                                  }
                                }
                              }
                            }

                            processDropdownItems(
                                it.rsavedItem[data.index],
                                it.rsavedid[data.index],
                                it.counters[data.index],
                                "Reassembly Service",
                                "house_removal");
                            processDropdownItems(
                                it.dsavedItem[data.index],
                                it.dismantlesavedid[data.index],
                                it.Dcounters[data.index],
                                "Dismantling Service",
                                "house_removal");
                            processDropdownItems(
                                it.psavedItem[data.index],
                                it.psavedid[data.index],
                                it.pcounters[data.index],
                                "Packing Service",
                                "house_removal");
                            updateItem.addAll(data.dataList);
                            it.addlist(data.index);
                            print(updateItem);
                            value.setLoading(true);
                            up.UpdateItemAPI(context,
                                    sp.get('orderId').toString(), updateItem)
                                .then((_) {

                              value.setLoading(false);
                              Navigator.pushReplacementNamed(
                                  context, RoutesName.singleOrder);
                              Utilis.submitted_flushbar_message(
                                  context, 'Success');
                            }).catchError((error) {
                              Utilis.error_flushbar_message(context, 'Error');
                            });
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
