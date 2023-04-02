import 'package:flutter/material.dart';
import 'package:scotremovals/res/Components/Photo_Component.dart';

import '../constant/colors.dart';
import '../res/Components/Rounded_Button.dart';

class Add_Photo_View extends StatefulWidget {
  @override
  State<Add_Photo_View> createState() => _Add_Photo_View();
}

class _Add_Photo_View extends State<Add_Photo_View> {
  @override
  Widget build(BuildContext context) {
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
          'Add Photo',
          style: TextStyle(
            color: BC.white,
            fontSize: width * 0.067,
            fontFamily: "HelveticaBold",
          ),
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
              'Please add the photo of item/s if it is already damaged or if you doubt about any product. ',
              style: TextStyle(
                  fontFamily: "HelveticaRegular",
                  fontSize: width * 0.048,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Add Images',
              style: TextStyle(
                  fontFamily: "HelveticaBold",
                  fontSize: width * 0.048,
                  color: BC.blue),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.65,
              child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return const Card(
                      elevation: 2,
                      child: Photo_Component(),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Rounded_Button2(
                  width: width * 0.9,
                  height: height * 1,
                  title: "DONE",
                  onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
