import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'askForSignature.dart';

class AddComment extends StatefulWidget {
  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
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
          'Add Comment',
          style: TextStyle(
            color: BC.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              maxLines: 6,
              decoration: InputDecoration(
                  hintText: 'Add Comment.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AskForSignature(),
                    ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: BC.blue),
                    child: Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
