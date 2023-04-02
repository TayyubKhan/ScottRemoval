import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../res/Components/Rounded_Button.dart';

class Waiver_Form_View extends StatefulWidget {
  @override
  State<Waiver_Form_View> createState() => _Waiver_Form_ViewState();
}

class _Waiver_Form_ViewState extends State<Waiver_Form_View> {
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
          'Liability Waiver Form',
          style: TextStyle(
            color: BC.white,
            fontSize: width * 0.067,
            fontFamily: "HelveticaBold",
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'In the event of something being damaged as a result of the item move, such as damage to the collection or delivery property, you hereby agree that our liability to you is waivered. Signing ths Liability Waiver Form is in accordance with Ts&Cs found on our website.',
                      style: TextStyle(
                          fontFamily: "HelveticaRegular",
                          fontSize: width * 0.048,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'If you do not wish to sign this waiver form, please call the Scot Removals office.',
                      style: TextStyle(
                          fontFamily: "HelveticaRegular",
                          fontSize: width * 0.048,
                          color: BC.lightGrey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLines: 10,
                      style: TextStyle(
                        fontFamily: "HelveticaRegular",
                        fontSize: width * 0.048,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    SizedBox(
                      height: height * 0.33,
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
