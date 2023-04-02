import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'addItems.dart';

class AddFloors extends StatefulWidget {
  @override
  State<AddFloors> createState() => _AddFloorsState();
}

class _AddFloorsState extends State<AddFloors> {
  late Object _itemValue;
  var itemList = ['1st Floor', '2nd Floor', '3rd Floor', '4th Floor'];
  bool mada = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BC.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: BC.white,
            )),
        title: Text(
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'PickUp/DropoffLocation',
                  hintStyle: TextStyle(
                    color: BC.lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BC.lightGrey),
              ),
              child: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  hint: Text('Floors'),
                  underline: SizedBox(),
                  icon: Icon(
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
                Text(
                  'Lift Available ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddItems(),
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: BC.blue),
                child: Text(
                  'DONE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
