import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'addFloors.dart';

class AdditemFloors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BC.blue,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: BC.white,
            )),
        title: Text(
          'Add Items and Floors',
          style: TextStyle(
            color: BC.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Additional Items (£ 13.99)',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image(
                  image: AssetImage('assets/addMenu.png'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Additional Floors',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image(
                  image: AssetImage('assets/floors.png'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Other Additions',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Image(
                  image: AssetImage('assets/add.png'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total Additional Charges:',
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
                  builder: (context) => AddFloors(),
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
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}
