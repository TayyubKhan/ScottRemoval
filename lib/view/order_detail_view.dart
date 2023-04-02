import 'package:flutter/material.dart';
import 'package:scotremovals/res/Components/CardComponents.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';

import '../constant/colors.dart';

// ignore: camel_case_types
class Order_Detail extends StatefulWidget {
  const Order_Detail({super.key});

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 32,
              color: BC.white,
            )),
        title: Text(
          '#12345',
          style: TextStyle(
              fontSize: width * 0.067,
              fontFamily: "HelveticaBold",
              color: BC.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/Map.png',
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: BC.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              'DUE 23:00',
                              style: TextStyle(color: BC.white, fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: BC.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              'PICKUP',
                              style: TextStyle(color: BC.white, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      width: width,
                      child: const Text(
                        '19 Kingshill Avenue, Glasgow, Lanarkshire, G68 9NF, United Kingdom',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "HelveticaBold",
                            color: Colors.black),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Scheduled For',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '23:00',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'ETA',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '12:30',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                child: Image(
                                  image: AssetImage(
                                      'assets/profile_photo_placeholder.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Contact'),
                                  Text(
                                    'Janice Jeffrey',
                                    style: TextStyle(
                                      fontFamily: "HelveticaBold",
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Image(
                                image: AssetImage('assets/comment.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image(
                                image: AssetImage('assets/phone.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Text('Order Description'),
                    const Text(
                      'Home Removals (est. 15.12 m3, 2 men)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "HelveticaBold",
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order',
                            style: TextStyle(fontSize: 15),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Total Items: ',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '45',
                                style: TextStyle(
                                    fontFamily: "HelveticaBold", fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Image(
                          image: AssetImage('assets/item.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('1 x 8 Sitting Dining Table '),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Image(
                          image: AssetImage('assets/item.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('1 x 8 Sitting Dining Table '),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Rounded_Button2(
                          width: width * 0.7,
                          height: height * 1,
                          title: 'Complete PICKUP',
                          onPress: () {
                            Navigator.pushNamed(
                                context, RoutesName.addItemsAndFloors);
                          },
                        ),
                        Rounded_Button2(
                          width: width * 0.2,
                          height: height * 1,
                          title: '+',
                          onPress: () {
                            dialogBox();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dialogBox() {
    return showDialog(
        barrierColor: Colors.white.withOpacity(0.9),
        context: context,
        builder: (ctx) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              elevation: 0.0,
              backgroundColor: Colors.white.withOpacity(0.0),
              content: Center(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Card_Components(
                              onPress: () {
                                Navigator.pushNamed(
                                    context, RoutesName.waiverForm);
                              },
                              title: "Waiver Form",
                              IconImage: 'assets/attach.png'),
                          Card_Components(
                              onPress: () {
                                Navigator.pushNamed(
                                    context, RoutesName.addItems);
                              },
                              title: "Add Item",
                              IconImage: 'assets/add.png'),
                          Card_Components(
                              onPress: () {
                                Navigator.pushNamed(context, RoutesName.photo);
                              },
                              title: "Photo",
                              IconImage: 'assets/Group 11.png'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card_Components(
                              onPress: () {
                                Navigator.pushNamed(
                                    context, RoutesName.comment);
                              },
                              title: "Comment",
                              IconImage: "assets/comment.png"),
                          Card_Components(
                              onPress: () {
                                Navigator.pushNamed(
                                    context, RoutesName.signature);
                              },
                              title: "Signature",
                              IconImage: "assets/signature.png"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
