// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

import '../colors.dart';

class Rounded_Button extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const Rounded_Button(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
            height: height * 0.06,
            width: width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35), color: BC.login),
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: BC.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Text(title,
                            style: const TextStyle(
                                color: BC.textcolor,
                                fontFamily: "HelveticaBold")),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.login_sharp,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  )),
      ),
    );
  }
}

class Rounded_Button2 extends StatelessWidget {
  final String title;
  var height;
  var width;
  final bool loading;
  final VoidCallback onPress;
  Rounded_Button2(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height * 0.07,
          width: width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35), color: BC.login),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: BC.white,
                  )
                : Center(
                    child: Text(title,
                        style: TextStyle(
                            color: BC.textcolor,
                            fontSize: width * 0.06,
                            fontFamily: "HelveticaBold")),
                  ),
          )),
    );
  }
}
