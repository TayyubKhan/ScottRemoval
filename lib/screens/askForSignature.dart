import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'addPhoto.dart';

class AskForSignature extends StatefulWidget {
  @override
  State<AskForSignature> createState() => _AskForSignatureState();
}

class _AskForSignatureState extends State<AskForSignature> {
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
          'Ask For Signature',
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
            Text(
              'Please sign below to acknowledge receipt of item/s specified on your Booking Conformation.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Clear Signature',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 15, color: BC.blue),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              maxLines: 6,
              decoration: InputDecoration(
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
                      builder: (context) => AddPhoto(),
                    ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 15),
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
