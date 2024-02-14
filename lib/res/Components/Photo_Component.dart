import 'package:flutter/material.dart';

class Photo_Component extends StatelessWidget {
  const Photo_Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/addPhoto.png'),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            'Take Image',
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontFamily: "HelveticaRegular", fontSize: width * 0.048),
          ),
        ],
      ),
    );
  }
}
