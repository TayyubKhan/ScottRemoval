import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../screens/addItems.dart';

class Add_Floor_View extends StatefulWidget {
  @override
  State<Add_Floor_View> createState() => _Add_Floor_ViewState();
}

class _Add_Floor_ViewState extends State<Add_Floor_View> {
  late Object _itemValue;
  var itemList = ['1st Floor', '2nd Floor', '3rd Floor', '4th Floor'];
  bool mediaa = false;
  @override
  Widget build(BuildContext context) {
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
              child: MyDropdownMenu(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    tristate: true,
                    checkColor: BC.blue,
                    activeColor: BC.white,
                    value: mediaa,
                    onChanged: (media) {
                      setState(() {
                        mediaa = media!;
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
              children: const [
                Text(
                  'Total Additional Charges: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  '£ 13.99',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddItems(),
                ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: BC.blue),
                child: const Text(
                  'DONE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
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
      hint: Text('Floors'),
      underline: SizedBox(),
      icon: Icon(
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
