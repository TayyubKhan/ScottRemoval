import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/model/WonJobModel.dart';
import 'package:scotremovals/res/Components/Call_and_Message.dart';
import 'package:scotremovals/res/Components/CardComponents.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/home_repo.dart';
import '../repository/withourmodel_repo.dart';
import '../res/colors.dart';
import '../view_model/dataViewModel.dart';

// ignore: camel_case_types
class Order_Detail extends StatefulWidget {
  const Order_Detail({super.key});

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

WithoutModelRepo withoutModelRepo = WithoutModelRepo();
HomeRepository homeRepository = HomeRepository();
Calland_message calland_message = Calland_message();

class _Order_DetailState extends State<Order_Detail> {
  Future<void> fetchData() async {
    homeRepository.fetchData(context);
  }

  Future<void> _refreshData() async {
    try {
      await fetchData();
    } catch (error) {
      // Handle the error here
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $error'),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    final data = Provider.of<DataViewViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    int index = int.parse(data.data[3]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BC.login,
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
        title: FutureBuilder<WonJobModel>(
          future: homeRepository.fetchData(context),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.data![index].id.toString(),
                style: TextStyle(
                    fontSize: width * 0.067,
                    fontFamily: "HelveticaBold",
                    color: BC.white),
              );
            }
            return const Text('Let me Setup things for you');
          },
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: FutureBuilder<WonJobModel>(
            future: homeRepository.fetchData(context),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<Map<String, dynamic>> dataList =
                    List<Map<String, dynamic>>.from(jsonDecode(
                        snapshot.data!.data![index].productsList.toString()));
                return SizedBox(
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.data![index].endTime
                                            .toString()
                                            .substring(0, 5),
                                        style: const TextStyle(
                                            color: BC.white, fontSize: 13),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child: Text(
                                        'PICKUP',
                                        style: TextStyle(
                                            color: BC.white, fontSize: 13),
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
                                child: Text(
                                  data.data[0],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Scheduled For',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        snapshot.data!.data![index].strtTime
                                            .toString()
                                            .substring(0, 5),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'ETA',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        snapshot.data!.data![index].endTime
                                            .toString()
                                            .substring(0, 5),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Contact'),
                                            Text(
                                              snapshot.data!.data![index]
                                                  .deliveryName
                                                  .toString(),
                                              style: const TextStyle(
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
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            calland_message.makeMessage(snapshot
                                                .data!
                                                .data![index]
                                                .deliveryPhone
                                                .toString());
                                          },
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/comment.png'),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.05),
                                        InkWell(
                                          onTap: () {
                                            calland_message.makePhoneCall(
                                                snapshot.data!.data![index]
                                                    .deliveryPhone
                                                    .toString());
                                          },
                                          child: const Image(
                                            image:
                                                AssetImage('assets/phone.png'),
                                          ),
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
                              Text(
                                data.data[1],
                                style: const TextStyle(
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Order',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: width * 0.6,
                                            height: height * 0.14,
                                            child: ListView.builder(
                                              itemCount: dataList.length,
                                              itemBuilder: (context, i) {
                                                total = total +
                                                    int.parse(dataList[i]
                                                        ['quantity']);
                                                return Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Image(
                                                          image: AssetImage(
                                                              'assets/item.png'),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          dataList[i]
                                                                  ['quantity'] +
                                                              ' x ' +
                                                              dataList[i]
                                                                      ['name']
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "HelveticaRegular",
                                                            color: Colors.black,
                                                            fontSize:
                                                                width * 0.04,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.03,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ]),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Items: ',
                                          style:
                                              TextStyle(fontSize: width * 0.04),
                                        ),
                                        Text(
                                          total.toString(),
                                          style: const TextStyle(
                                              fontFamily: "HelveticaBold",
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Rounded_Button2(
                                    width: width * 0.7,
                                    height: height * 1,
                                    title: 'Complete PICKUP',
                                    onPress: () {},
                                  ),
                                  Rounded_Button2(
                                    width: width * 0.2,
                                    height: height * 1,
                                    title: '+',
                                    onPress: () async {
                                      SharedPreferences sp =
                                          await SharedPreferences.getInstance();
                                      sp.setString(
                                          'id',
                                          snapshot.data!.data![index].id
                                              .toString());
                                      dialogBox(context);
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
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  dialogBox(BuildContext context) {
    return showDialog(
        barrierColor: Colors.white.withOpacity(0.9),
        context: context,
        builder: (ctx) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              elevation: 0.0,
              backgroundColor: Colors.white.withOpacity(0.0),
              content: Center(
                child: SizedBox(
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
                                    context, RoutesName.addItemsAndFloors);
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
