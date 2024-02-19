import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

import '../res/colors.dart';

class ItemsAndFloorView extends StatelessWidget {
  const ItemsAndFloorView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.08,
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: BC.white,
              )),
          title: Text(
            'Add Items and Floors',
            style: TextStyle(
                fontSize: width * 0.058,
                fontFamily: "HelveticaBold",
                color: BC.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.addItems);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Additional Items',
                          style: TextStyle(
                              fontFamily: "HelveticaRegular",
                              fontSize: width * 0.04),
                        ),
                      ],
                    ),
                    const Image(
                      image: AssetImage('assets/addMenu.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.addFloors);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Additional Floors',
                      style: TextStyle(
                          fontFamily: "HelveticaRegular",
                          fontSize: width * 0.04),
                    ),
                    const Image(
                      image: AssetImage('assets/floors.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.extraitem);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Other Additions',
                      style: TextStyle(
                          fontFamily: "HelveticaRegular",
                          fontSize: width * 0.04),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RoutesName.extraitem);

                      },
                      child: const CircleAvatar(
                        backgroundColor: BC.login,
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Total Additional Charges:',
                    style: TextStyle(fontFamily: "HelveticaBold", fontSize: 15),
                  ),
                  Consumer<DataViewViewModel>(builder: (context, value, child) {
                    return Text(value.price.toString(),
                        style: const TextStyle(
                            fontFamily: "HelveticaBold", fontSize: 15));
                  }),
                ],
              ),
              const Spacer(),
              Rounded_Button2(
                  width: width * 0.8,
                  height: height * 1,
                  title: "DONE",
                  onPress: () {
                    Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
