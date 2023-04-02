import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../res/Components/Rounded_Button.dart';

class Comment_View extends StatefulWidget {
  @override
  State<Comment_View> createState() => _Comment_ViewState();
}

class _Comment_ViewState extends State<Comment_View> {
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
          'Add Comment',
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
            TextFormField(
              keyboardType: TextInputType.text,
              maxLines: 10,
              style: TextStyle(
                color: BC.white,
                fontSize: width * 0.048,
                fontFamily: "HelveticaRegular",
              ),
              decoration: InputDecoration(
                  hintText: 'Add Comment.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const Spacer(),
            Center(
              child: Rounded_Button2(
                  width: width * 0.9,
                  height: height * 1,
                  title: "DONE",
                  onPress: () {}),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
