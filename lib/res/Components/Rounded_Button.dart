import 'package:flutter/material.dart';

import '../../constant/colors.dart';
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
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height * 0.05,
          width: width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: BC.login),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(
                      color: BC.login,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: width * 0.125,
                        ),
                        Text(title,
                            style: const TextStyle(
                                color: textcolor, fontFamily: "HelveticaBold")),
                        const Icon(
                          Icons.login_sharp,
                          color: Colors.white,
                        )
                      ],
                    ))),
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
          height: height * 0.05,
          width: width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: BC.login),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: BC.login,
                  )
                : Center(
                    child: Text(title,
                        style: const TextStyle(
                            color: textcolor,
                            fontSize: 18,
                            fontFamily: "HelveticaBold")),
                  ),
          )),
    );
  }
}
