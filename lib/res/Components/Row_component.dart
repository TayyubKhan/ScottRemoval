// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../colors.dart';

class RowComponent extends StatelessWidget {
  String string1, string2;
  RowComponent({Key? key, required this.string1, required this.string2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(string1,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: BC.textcolor)),
        Text(
          string2,
          style: const TextStyle(color: BC.textcolor),
        )
      ],
    );
  }
}
