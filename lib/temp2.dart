import 'package:flutter/material.dart';
import 'package:scotremovals/repository/home_repo.dart';

class Temp3 extends StatefulWidget {
  const Temp3({super.key});

  @override
  State<Temp3> createState() => _Temp3State();
}

class _Temp3State extends State<Temp3> {
  final rp = HomeRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              rp.fetchData(context);
            },
            child: Text('Tap')),
      ),
    );
  }
}
