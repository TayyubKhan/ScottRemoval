import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function onPressed;

  final Color color;
  MyButton({required this.name, required this.onPressed, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            onPressed;
          },
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )),
    );
  }
}
