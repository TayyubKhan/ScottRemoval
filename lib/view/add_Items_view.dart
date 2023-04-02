import 'package:flutter/material.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';

import '../constant/colors.dart';

class Add_Items_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: BC.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: BC.white,
            )),
        title: Text(
          'Add Items',
          style: TextStyle(
              color: BC.white,
              fontSize: width * 0.067,
              fontFamily: "HelveticaBold"),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Please only add item which are not present on job sheet inventory',
              style: TextStyle(
                fontFamily: "HelveticaRegular",
                color: Colors.black,
                fontSize: width * 0.048,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Search Items..',
                  hintStyle: const TextStyle(
                    color: BC.lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Additional Items (1)',
              style: TextStyle(
                fontSize: width * 0.048,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Four Seater Sofa',
                          style: TextStyle(
                              fontSize: width * 0.048,
                              fontFamily: "HelveticaRegular",
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: BC.blue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                                color: BC.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontFamily: "HelveticaRegular",
                                  fontSize: width * 0.045),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: BC.blue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                                color: BC.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Color(0xffE10000),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Center(
              child: Rounded_Button2(
                  width: width * 0.9,
                  height: height * 1,
                  title: "DONE",
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.addFloors);
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
