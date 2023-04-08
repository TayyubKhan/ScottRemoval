import 'package:flutter/material.dart';

class Drawer_ROW extends StatelessWidget {
  String title;
  ImageIcon icon;
  final VoidCallback onPressed;
  Drawer_ROW(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
