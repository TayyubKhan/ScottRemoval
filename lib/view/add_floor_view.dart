import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/ExtraItemFloorViewModel.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

import '../repository/SlugListRepo.dart';
import '../repository/floor_repo.dart';
import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';

class Add_Floor_View extends StatefulWidget {
  const Add_Floor_View({super.key});

  @override
  State<Add_Floor_View> createState() => _Add_Floor_ViewState();
}

late String _selectedFloor;

class _Add_Floor_ViewState extends State<Add_Floor_View> {
  @override
  String text = '';
  TextEditingController controller = TextEditingController();
  SlugListRepo slugListRepo = SlugListRepo();
  FloorAndItemRepo floorAndItemRepo = FloorAndItemRepo();
  final FocusNode _focusNode = FocusNode();
  late String _itemValue = 'Select floor';
  final slugMap = {
    'ground': 'Ground floor',
    'first': 'First floor',
    'second': 'Second floor',
    'third': 'Third floor',
    'fourth': 'Fourth floor',
    'fifth': 'Fifth floor',
    'sixth': 'Sixth floor',
  };

  var itemList = [
    'Select floor',
    'Ground floor',
    'First floor',
    'Second floor',
    'Third floor',
    'Fourth floor',
    'Fifth floor',
    'Sixth floor'
  ];
  String floor = '';
  bool mada = false;
  bool isAgain = false;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataViewViewModel>(context);
    final exit = Provider.of<ExtraItemViewViewModel>(context, listen: true);
    final item = Provider.of<ItemViewViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.location[data.index]['pickup']!,
                style: const TextStyle(
                  fontFamily: 'HelveticaRegular',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                if (isAgain == false) {
                  data.removeprice();
                  for (int i = 0; i < data.ids[data.index].length; i++) {
                    slugListRepo
                        .fetchWithPrices(
                            data.location[data.index]['slug']!,
                            context,
                            int.parse(data.ids[data.index][i]['id'].toString()))
                        .then((value) {
                      if (value != null && value != 'No_product_item_found') {
                        data.getPrice(double.parse(value.toString()));
                      }
                    });
                    isAgain = true;
                  }
                }
                floor = data.location[data.index]['slug']!;
                List<String> floors = floor.split('_to_');
                String initialFloor = floors.isNotEmpty ? floors.last : 'Select floor';
                 _itemValue = slugMap[initialFloor] ?? 'Select floor';
                return Container(
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
                      onChanged: (value) async {
                        data.removeprice();
                        setState(() {
                          _itemValue = value!;
                        });
                      },
                      items: itemList.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList()),
                );
              }),
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
                        '£ ${value.price.toString()}',
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
                      width: width * 0.9,
                      height: height * 1,
                      title: "DONE",
                      onPress: () async {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.singleOrder);

                        // Navigator.pushReplacementNamed(context, RoutesName.waiverForm);
                      });
                },
              )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
  final List<String> _dropdownItems = [
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
