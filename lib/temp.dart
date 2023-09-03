// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/image.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  dynamic bytes;
  GetImageData order = GetImageData();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataViewViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Center(
        child: Consumer<AuthViewModelProvider>(
          builder: (context, value, child) {
            return Rounded_Button2(
              width: width * 0.9,
              loading: value.loading,
              height: height * 1,
              title: "DONE",
              onPress: () async {
                value.setLoading(true);

                value.setLoading(false);
              },
            );
          },
        ),
      ),
    );
  }
}
