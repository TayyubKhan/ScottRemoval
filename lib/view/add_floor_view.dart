import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

import '../repository/SlugListRepo.dart';
import '../repository/floor_repo.dart';
import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';

class Add_Floor_View extends StatefulWidget {
  @override
  State<Add_Floor_View> createState() => _Add_Floor_ViewState();
}

late String _selectedFloor;

class _Add_Floor_ViewState extends State<Add_Floor_View> {
  String text = '';
  TextEditingController controller = TextEditingController();
  SlugListRepo slugListRepo = SlugListRepo();
  FloorAndItemRepo floorAndItemRepo = FloorAndItemRepo();
  ItemViewViewModel item = ItemViewViewModel();
  DataViewViewModel data = DataViewViewModel();
  FocusNode _focusNode = FocusNode();
  late String _itemValue = 'Select floor';
  var itemList = [
    'Select floor',
    'Ground floor',
    'First floor',
    'Second floor',
    'Third floor',
    'Fourth floor',
    'Fifth floor',
    'sixth floor'
  ];
  bool mada = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BC.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: BC.white,
            )),
        title: const Text(
          'Add Floors',
          style: TextStyle(
            color: BC.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Utilis.error_flushbar_message(
                      context, 'Please Enter Floor name');
                } else if (!itemList.any((floor) =>
                    RegExp(floor, caseSensitive: false).hasMatch(value))) {
                  return Utilis.error_flushbar_message(
                      context, 'Please Enter valid Floor name');
                }
                return value;
              },
              controller: controller,
              onSaved: (value) {
                text = value.toString();
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'PickUp/DropoffLocation',
                  hintStyle: const TextStyle(
                    color: BC.lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BC.lightGrey),
              ),
              child: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  hint: const Text('Floors'),
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  value: _itemValue,
                  onChanged: (value) {
                    setState(() {
                      _itemValue = value!;
                    });
                  },
                  items: itemList.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    // tristate: true,
                    checkColor: BC.blue,
                    activeColor: BC.white,
                    value: mada,
                    onChanged: (media) {
                      setState(() {
                        mada = media!;
                      });
                    }),
                const Text(
                  'Lift Available ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Total Additional Charges: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Consumer<DataViewViewModel>(
                  builder: (BuildContext context, value, child) {
                    return Text(
                      '£ ${value.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            Center(child: Consumer<AuthViewModelProvider>(
              builder: (BuildContext context, value, child) {
                return Rounded_Button2(
                    loading: value.loading,
                    width: width * 0.9,
                    height: height * 1,
                    title: "DONE",
                    onPress: () {
                      print(controller.text);
                      slugListRepo.fetchWithPrices(controller.text, _itemValue);
                     Navigator.pushNamed(context, RoutesName.waiverForm);
                    });
              },
            )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: BC.blue,
    //     leading: IconButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         icon: const Icon(
    //           Icons.arrow_back_ios,
    //           color: BC.white,
    //         )),
    //     title: const Text(
    //       'Add Floors',
    //       style: TextStyle(
    //         color: BC.white,
    //         fontSize: 20,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //     child: Column(
    //       children: [
    //         TextFormField(
    //           keyboardType: TextInputType.name,
    //           decoration: InputDecoration(
    //               hintText: 'PickUp/DropoffLocation',
    //               hintStyle: const TextStyle(
    //                 color: BC.lightGrey,
    //               ),
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //               )),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             border: Border.all(color: BC.lightGrey),
    //           ),
    //           child: Consumer<FloorModel>(
    //             builder: (context, floorModel, child) {
    //               return Consumer<ItemViewViewModel>(
    //                   builder: (context, ItemModel, child) {
    //                 return FutureBuilder(
    //                   future: floorAndItemRepo.GetItemsDetails(),
    //                   builder: (BuildContext context,
    //                       AsyncSnapshot<dynamic> snapshot) {
    //                     if (snapshot.hasData) {
    //                       for (int i = 0;
    //                           i < snapshot.data['floors'].length;
    //                           i++) {
    //                         ItemModel.getFloor(
    //                             snapshot.data['floors'][i]['name'].toString());
    //                       }
    //                       return DropdownButton(
    //                         focusNode: _focusNode,
    //                         borderRadius: BorderRadius.circular(10),
    //                         isExpanded: true,
    //                         hint: const Text('Search Floor'),
    //                         underline: const SizedBox(),
    //                         icon: const Icon(
    //                           Icons.search,
    //                         ),
    //                         value: ItemModel.selectedFloor ??
    //                             ItemModel.selectFloor,
    //                         onChanged: (String? value) {
    //                           _selectedFloor = value.toString();
    //                           _focusNode.unfocus();
    //                         },
    //                         items: ItemModel.dropDownIList2.map((item) {
    //                           return DropdownMenuItem(
    //                             value: item,
    //                             child: Text(item),
    //                           );
    //                         }).toList(),
    //                       );
    //                     }
    //                     return DropdownButton(
    //                       borderRadius: BorderRadius.circular(10),
    //                       isExpanded: true,
    //                       hint: const Text('Wait'),
    //                       underline: const SizedBox(),
    //                       icon: const Icon(
    //                         Icons.keyboard_arrow_down,
    //                       ),
    //                       items: [],
    //                       onChanged: (value) {},
    //                     );
    //                   },
    //                 );
    //               });
    //             },
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Checkbox(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(1),
    //                 ),
    //                 tristate: true,
    //                 checkColor: BC.blue,
    //                 activeColor: BC.white,
    //                 value: mediaa,
    //                 onChanged: (media) {
    //                   setState(() {
    //                     mediaa = media!;
    //                   });
    //                 }),
    //             const Text(
    //               'Lift Available ',
    //               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: const [
    //             Text(
    //               'Total Additional Charges: ',
    //               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    //             ),
    //             Text(
    //               '£ 13.99',
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    //             ),
    //           ],
    //         ),
    //         const Spacer(),
    //         InkWell(
    //           onTap: () {
    //             Navigator.of(context).push(MaterialPageRoute(
    //               builder: (context) => AddItems(),
    //             ));
    //           },
    //           child: Container(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(30), color: BC.blue),
    //             child: const Text(
    //               'DONE',
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({Key? key}) : super(key: key);

  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String _selectedItem = 'Select Floor'; // initial dropdown value

  // list of dropdown items
  List<String> _dropdownItems = [
    'Select Floor',
    '1st Floor ',
    '2nd Floor',
    '3rd Floor',
    '4rth Floor',
    '5th Floor',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(10),
      isExpanded: true,
      hint: const Text('Floors'),
      underline: const SizedBox(),
      icon: const Icon(
        Icons.keyboard_arrow_down,
      ),
      value: _selectedItem,
      onChanged: (value) {
        setState(() {
          _selectedItem = value.toString();
        });
      },
      items: _dropdownItems.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
