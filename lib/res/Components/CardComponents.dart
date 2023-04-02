import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class Card_Components extends StatelessWidget {
  final VoidCallback onPress;
  final String IconImage;
  final String title;
  Card_Components(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.IconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              ImageIcon(
                AssetImage(IconImage),
                color: BC.login,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: "HelveticaBold", fontSize: width * 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
