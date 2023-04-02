import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../widgets/myDrawer.dart';
import 'orderDetail.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<String> option = [
    'Picked',
    'Dropoff',
    'Picked',
    'Dropoff',
    'Dropoff',
    'Dropoff',
  ];
  late int selectedIndex;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffold.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        title: const Text(
          'My Orders',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: BC.white),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            color: BC.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              myContainer(index),
              const Divider(
                thickness: 2,
              )
            ],
          );
        }),
      ),
    );
  }

  myContainer(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrderDetail(),
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                  color: selectedIndex == index ? BC.green : BC.white,
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.96,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '#12345',
                          style: TextStyle(
                            color: BC.lightGrey,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: BC.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              'Picked',
                              style: TextStyle(color: BC.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          '19 Kingshill Avenue, Glasgow, Lanarkshire, G68 9NF, United Kingdom',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Home Removals (est. 15.12 m3, 2 men)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
