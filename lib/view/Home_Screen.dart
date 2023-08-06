// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/home_repo.dart';
import 'package:scotremovals/view/signature_view.dart';
import 'package:scotremovals/view_model/ExtraItemFloorViewModel.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/WonJobModel.dart';
import '../repository/dropoutrepo.dart';
import '../repository/pickuprepo.dart';
import '../res/Components/myDrawer.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../view_model/AdditemsViewVIewModel.dart';
import '../view_model/auth_view_model.dart';

// ignore: camel_case_types
class Home_screen_View extends StatefulWidget {
  const Home_screen_View({Key? key}) : super(key: key);

  @override
  State<Home_screen_View> createState() => _Home_screen_ViewState();
}

class _Home_screen_ViewState extends State<Home_screen_View> {
  DropOutRepo dr = DropOutRepo();
  PickupRepo pk = PickupRepo();
  bool shows = true;
  HomeRepository homeRepository = HomeRepository();
  FocusNode focusNode = FocusNode();
  TextEditingController searchcontroller = TextEditingController();
  int selectedIndex = 0;
  Future<void> fetchData() async {
    homeRepository.fetchData(context);
  }

  Future<void> handle() async {
    await Future.delayed(const Duration(seconds: 10));
    shows = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shows = true;
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final show = Provider.of<AuthViewModelProvider>(context);
    final dvv = Provider.of<DataViewViewModel>(context);
    final it = Provider.of<ItemViewViewModel>(context, listen: true);
    final exit = Provider.of<ExtraItemViewViewModel>(context, listen: true);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    final signature = Provider.of<SignatureProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        // Return true to allow back navigation, or false to disable it
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffold,
          drawer: MyDrawer(),
          appBar: AppBar(
            backgroundColor: BC.login,
            toolbarHeight: height * 0.08,
            leading: IconButton(
                onPressed: () {
                  _scaffold.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, size: 32)),
            title: Text(
              'My Orders',
              style: TextStyle(
                  fontSize: width * 0.058,
                  fontFamily: "HelveticaBold",
                  color: BC.white),
            ),
            centerTitle: true,
            actions: [
              Consumer<AuthViewModelProvider>(
                builder: (BuildContext context, v, Widget? child) {
                  return Visibility(
                    visible: v.show == true ? true : false,
                    child: SizedBox(
                        width: width * 0.4,
                        height: height * 0.1,
                        child: Center(
                          child: TextField(
                            focusNode: focusNode,
                            onTapOutside: (value) {
                              focusNode.unfocus();
                            },
                            cursorOpacityAnimates: true,
                            onTap: () {},
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: const TextStyle(color: BC.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Id',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                  onTap: () {
                                    searchcontroller.clear();
                                    v.showed();
                                    setState(() {});
                                  },
                                  child:
                                      const Icon(Icons.close, color: BC.white)),
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                              ),
                            ),
                            controller: searchcontroller,
                          ),
                        )),
                  );
                },
              ),
              Row(
                children: [
                  Consumer<AuthViewModelProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Visibility(
                        visible: value.show == false ? true : false,
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                            value.showed();
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: BC.white,
                              ),
                              SizedBox(
                                width: width * 0.047,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              shows = true;
              // await homeRepository.fetchData(context);
              setState(() {});
            },
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    FutureBuilder<WonJobModel>(
                        future: homeRepository.fetchData(context),
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            handle();
                            return shows == true
                                ? SizedBox(
                                    height: height * 0.5,
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                      color: BC.blue,
                                    )))
                                : SizedBox(
                                    height: height,
                                    child: const Center(
                                        child: Text('Refresh Please')));
                          }
                          return Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                itemCount: snapshot.data!.orderCount,
                                itemBuilder: ((context, index) {
                                  String id =
                                      snapshot.data!.data![index].id.toString();
                                  if (searchcontroller.text.isEmpty) {
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                SharedPreferences sp =
                                                    await SharedPreferences
                                                        .getInstance();
                                                print('fsafsaf');
                                                print(
                                                    sp.get('email').toString());

                                                if (sp
                                                        .get('orderId')
                                                        .toString() !=
                                                    snapshot
                                                        .data!.data![index].id
                                                        .toString()) {
                                                  signature.setshow(true);
                                                  it.clear();
                                                  exit.clear();
                                                }
                                                sp.setString(
                                                    'orderId',
                                                    snapshot
                                                        .data!.data![index].id);
                                                // await pk.PickupApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // await dr.DropApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // sp.remove('orderId');
                                                dvv.setIndex(index);
                                                dvv.setStatus(true);
                                                String desc =
                                                    '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                                                dvv.clear();
                                                dvv.setData([
                                                  snapshot.data!.data![index]
                                                      .deliveryAddress
                                                      .toString(),
                                                  desc.toString(),
                                                  snapshot.data!.data![index].id
                                                      .toString(),
                                                  index.toString(),
                                                ]);
                                                Navigator.pushNamed(context,
                                                    RoutesName.singleOrder);
                                              },
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              selectedIndex ==
                                                                      index
                                                                  ? BC.green
                                                                  : BC.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      width: width * 0.96,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .orderId
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaRegular",
                                                                    color: BC
                                                                        .lightGrey,
                                                                    fontSize:
                                                                        width *
                                                                            0.038,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5),
                                                                  decoration: BoxDecoration(
                                                                      color: BC
                                                                          .green,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Pick Up',
                                                                      style: TextStyle(
                                                                          color: BC
                                                                              .white,
                                                                          fontSize:
                                                                              width * 0.036),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .pickupAddress
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaBold",
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Text(
                                                              '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.036,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                SharedPreferences sp =
                                                    await SharedPreferences
                                                        .getInstance();

                                                if (sp
                                                        .get('orderId')
                                                        .toString() !=
                                                    snapshot
                                                        .data!.data![index].id
                                                        .toString()) {
                                                  print('created');

                                                  signature.setshow(true);
                                                  it.clear();
                                                  exit.clear();
                                                }
                                                sp.setString(
                                                    'orderId',
                                                    snapshot
                                                        .data!.data![index].id);
                                                // await pk.PickupApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // await dr.DropApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // sp.remove('orderId');
                                                dvv.setIndex(index);
                                                dvv.setStatus(false);

                                                String desc =
                                                    '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                                                dvv.clear();
                                                dvv.setData([
                                                  snapshot.data!.data![index]
                                                      .deliveryAddress
                                                      .toString(),
                                                  desc.toString(),
                                                  snapshot.data!.data![index].id
                                                      .toString(),
                                                  index.toString(),
                                                ]);
                                                Navigator.pushNamed(context,
                                                    RoutesName.singleOrder);
                                              },
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              selectedIndex ==
                                                                      index
                                                                  ? Colors.red
                                                                  : BC.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      width: width * 0.96,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .orderId
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaRegular",
                                                                    color: BC
                                                                        .lightGrey,
                                                                    fontSize:
                                                                        width *
                                                                            0.038,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Drop Off',
                                                                      style: TextStyle(
                                                                          color: BC
                                                                              .white,
                                                                          fontSize:
                                                                              width * 0.036),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .deliveryAddress
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaBold",
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Text(
                                                              '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.036,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  } else if (id
                                      .contains(searchcontroller.text)) {
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                SharedPreferences sp =
                                                    await SharedPreferences
                                                        .getInstance();

                                                if (sp
                                                        .get('orderId')
                                                        .toString() !=
                                                    snapshot
                                                        .data!.data![index].id
                                                        .toString()) {
                                                  signature.setshow(true);
                                                  it.clear();
                                                  exit.clear();
                                                }
                                                sp.setString(
                                                    'orderId',
                                                    snapshot
                                                        .data!.data![index].id);
                                                // await pk.PickupApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // await dr.DropApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // sp.remove('orderId');
                                                dvv.setIndex(index);
                                                dvv.setStatus(true);
                                                String desc =
                                                    '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                                                dvv.clear();
                                                dvv.setData([
                                                  snapshot.data!.data![index]
                                                      .deliveryAddress
                                                      .toString(),
                                                  desc.toString(),
                                                  snapshot.data!.data![index].id
                                                      .toString(),
                                                  index.toString(),
                                                ]);
                                                Navigator.pushNamed(context,
                                                    RoutesName.singleOrder);
                                              },
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              selectedIndex ==
                                                                      index
                                                                  ? BC.green
                                                                  : BC.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      width: width * 0.96,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .orderId
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaRegular",
                                                                    color: BC
                                                                        .lightGrey,
                                                                    fontSize:
                                                                        width *
                                                                            0.038,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5),
                                                                  decoration: BoxDecoration(
                                                                      color: BC
                                                                          .green,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Pick Up',
                                                                      style: TextStyle(
                                                                          color: BC
                                                                              .white,
                                                                          fontSize:
                                                                              width * 0.036),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .pickupAddress
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaBold",
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Text(
                                                              '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.036,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                SharedPreferences sp =
                                                    await SharedPreferences
                                                        .getInstance();

                                                if (sp
                                                        .get('orderId')
                                                        .toString() !=
                                                    snapshot
                                                        .data!.data![index].id
                                                        .toString()) {
                                                  print('created');

                                                  signature.setshow(true);
                                                  it.clear();
                                                  exit.clear();
                                                }
                                                sp.setString(
                                                    'orderId',
                                                    snapshot
                                                        .data!.data![index].id);
                                                // await pk.PickupApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // await dr.DropApi(context, '0',
                                                //     sp.get('orderId').toString());
                                                // sp.remove('orderId');
                                                dvv.setIndex(index);
                                                dvv.setStatus(false);

                                                String desc =
                                                    '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                                                dvv.clear();
                                                dvv.setData([
                                                  snapshot.data!.data![index]
                                                      .deliveryAddress
                                                      .toString(),
                                                  desc.toString(),
                                                  snapshot.data!.data![index].id
                                                      .toString(),
                                                  index.toString(),
                                                ]);
                                                Navigator.pushNamed(context,
                                                    RoutesName.singleOrder);
                                              },
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              selectedIndex ==
                                                                      index
                                                                  ? BC.green
                                                                  : BC.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      width: width * 0.96,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .orderId
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaRegular",
                                                                    color: BC
                                                                        .lightGrey,
                                                                    fontSize:
                                                                        width *
                                                                            0.038,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Drop Off',
                                                                      style: TextStyle(
                                                                          color: BC
                                                                              .white,
                                                                          fontSize:
                                                                              width * 0.036),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .deliveryAddress
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "HelveticaBold",
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Text(
                                                              '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "HelveticaRegular",
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.036,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }),
                              ),
                              // ListView.builder(
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   shrinkWrap: true,
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 10),
                              //   itemCount: snapshot.data!.orderCount,
                              //   itemBuilder: ((context, index) {
                              //     String id =
                              //         snapshot.data!.data![index].id.toString();
                              //     if (searchcontroller.text.isEmpty) {
                              //       return Column(
                              //         children: [
                              //           InkWell(
                              //             onTap: () async {
                              //               SharedPreferences sp =
                              //                   await SharedPreferences
                              //                       .getInstance();
                              //
                              //               if (sp.get('orderId').toString() !=
                              //                   snapshot.data!.data![index].id
                              //                       .toString()) {
                              //                 print('created');
                              //
                              //                 signature.setshow(true);
                              //                 it.clear();
                              //                 exit.clear();
                              //               }
                              //               sp.setString('orderId',
                              //                   snapshot.data!.data![index].id);
                              //               // await pk.PickupApi(context, '0',
                              //               //     sp.get('orderId').toString());
                              //               // await dr.DropApi(context, '0',
                              //               //     sp.get('orderId').toString());
                              //               // sp.remove('orderId');
                              //               dvv.setIndex(index);
                              //               dvv.setStatus(false);
                              //
                              //               String desc =
                              //                   '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                              //               dvv.clear();
                              //               dvv.setData([
                              //                 snapshot.data!.data![index]
                              //                     .deliveryAddress
                              //                     .toString(),
                              //                 desc.toString(),
                              //                 snapshot.data!.data![index].id
                              //                     .toString(),
                              //                 index.toString(),
                              //               ]);
                              //               Navigator.pushNamed(context,
                              //                   RoutesName.singleOrder);
                              //             },
                              //             child: IntrinsicHeight(
                              //               child: Row(
                              //                 children: [
                              //                   Container(
                              //                     width: 8,
                              //                     decoration: BoxDecoration(
                              //                         color:
                              //                             selectedIndex == index
                              //                                 ? BC.green
                              //                                 : BC.white,
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 5)),
                              //                   ),
                              //                   Container(
                              //                     width: width * 0.96,
                              //                     padding: const EdgeInsets
                              //                             .symmetric(
                              //                         horizontal: 20,
                              //                         vertical: 5),
                              //                     child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .spaceBetween,
                              //                             children: [
                              //                               Text(
                              //                                 snapshot
                              //                                     .data!
                              //                                     .data![index]
                              //                                     .orderId
                              //                                     .toString(),
                              //                                 style: TextStyle(
                              //                                   fontFamily:
                              //                                       "HelveticaRegular",
                              //                                   color: BC
                              //                                       .lightGrey,
                              //                                   fontSize:
                              //                                       width *
                              //                                           0.038,
                              //                                 ),
                              //                               ),
                              //                               Container(
                              //                                 padding: const EdgeInsets
                              //                                         .symmetric(
                              //                                     horizontal:
                              //                                         10,
                              //                                     vertical: 5),
                              //                                 decoration: BoxDecoration(
                              //                                     color: Colors
                              //                                         .red,
                              //                                     borderRadius:
                              //                                         BorderRadius
                              //                                             .circular(
                              //                                                 15)),
                              //                                 child: Center(
                              //                                   child: Text(
                              //                                     'Drop Off',
                              //                                     style: TextStyle(
                              //                                         color: BC
                              //                                             .white,
                              //                                         fontSize:
                              //                                             width *
                              //                                                 0.036),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                           SizedBox(
                              //                             height: height * 0.01,
                              //                           ),
                              //                           Expanded(
                              //                             child: Container(
                              //                               padding:
                              //                                   const EdgeInsets
                              //                                           .only(
                              //                                       right: 10),
                              //                               width:
                              //                                   MediaQuery.of(
                              //                                           context)
                              //                                       .size
                              //                                       .width,
                              //                               child: Text(
                              //                                 snapshot
                              //                                     .data!
                              //                                     .data![index]
                              //                                     .deliveryAddress
                              //                                     .toString(),
                              //                                 maxLines: 2,
                              //                                 overflow:
                              //                                     TextOverflow
                              //                                         .ellipsis,
                              //                                 style: TextStyle(
                              //                                   fontFamily:
                              //                                       "HelveticaBold",
                              //                                   color: Colors
                              //                                       .black,
                              //                                   fontSize:
                              //                                       width *
                              //                                           0.05,
                              //                                   fontWeight:
                              //                                       FontWeight
                              //                                           .w600,
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: height * 0.01,
                              //                           ),
                              //                           Text(
                              //                             '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                              //                             style: TextStyle(
                              //                               fontFamily:
                              //                                   "HelveticaRegular",
                              //                               color: Colors.black,
                              //                               fontSize:
                              //                                   width * 0.036,
                              //                             ),
                              //                           ),
                              //                         ]),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //           const Divider(
                              //             thickness: 2,
                              //           )
                              //         ],
                              //       );
                              //     } else if (id
                              //         .contains(searchcontroller.text)) {
                              //       return Column(
                              //         children: [
                              //           InkWell(
                              //             onTap: () async {
                              //               setState(() {
                              //                 selectedIndex = index;
                              //               });
                              //               SharedPreferences sp =
                              //                   await SharedPreferences
                              //                       .getInstance();
                              //               sp.setString('orderId',
                              //                   snapshot.data!.data![index].id);
                              //               String desc =
                              //                   '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                              //               dvv.clear();
                              //               dvv.setData([
                              //                 snapshot.data!.data![index]
                              //                     .deliveryAddress
                              //                     .toString(),
                              //                 desc.toString(),
                              //                 snapshot.data!.data![index].id
                              //                     .toString(),
                              //                 index.toString()
                              //               ]);
                              //
                              //               Navigator.pushNamed(context,
                              //                   RoutesName.singleOrder);
                              //             },
                              //             child: SizedBox(
                              //               width: width,
                              //               height: height * 0.1,
                              //               child: Row(
                              //                 children: [
                              //                   Container(
                              //                     width: 8,
                              //                     decoration: BoxDecoration(
                              //                         color:
                              //                             selectedIndex == index
                              //                                 ? BC.green
                              //                                 : BC.white,
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 5)),
                              //                   ),
                              //                   Container(
                              //                     width: width * 0.96,
                              //                     padding: const EdgeInsets
                              //                             .symmetric(
                              //                         horizontal: 20,
                              //                         vertical: 5),
                              //                     child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .spaceBetween,
                              //                             children: [
                              //                               Text(
                              //                                 snapshot
                              //                                     .data!
                              //                                     .data![index]
                              //                                     .orderId
                              //                                     .toString(),
                              //                                 style: TextStyle(
                              //                                   fontFamily:
                              //                                       "HelveticaRegular",
                              //                                   color: BC
                              //                                       .lightGrey,
                              //                                   fontSize:
                              //                                       width *
                              //                                           0.038,
                              //                                 ),
                              //                               ),
                              //                               Container(
                              //                                 padding: const EdgeInsets
                              //                                         .symmetric(
                              //                                     horizontal:
                              //                                         10,
                              //                                     vertical: 5),
                              //                                 decoration: BoxDecoration(
                              //                                     color:
                              //                                         BC.green,
                              //                                     borderRadius:
                              //                                         BorderRadius
                              //                                             .circular(
                              //                                                 15)),
                              //                                 child: Center(
                              //                                   child: Text(
                              //                                     snapshot
                              //                                         .data!
                              //                                         .data![
                              //                                             index]
                              //                                         .orderStatus
                              //                                         .toString(),
                              //                                     style: TextStyle(
                              //                                         color: BC
                              //                                             .white,
                              //                                         fontSize:
                              //                                             width *
                              //                                                 0.036),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                           SizedBox(
                              //                             height: height * 0.01,
                              //                           ),
                              //                           Expanded(
                              //                             child: Container(
                              //                               padding:
                              //                                   const EdgeInsets
                              //                                           .only(
                              //                                       right: 10),
                              //                               width:
                              //                                   MediaQuery.of(
                              //                                           context)
                              //                                       .size
                              //                                       .width,
                              //                               child: Text(
                              //                                 snapshot
                              //                                     .data!
                              //                                     .data![index]
                              //                                     .deliveryAddress
                              //                                     .toString(),
                              //                                 maxLines: 2,
                              //                                 overflow:
                              //                                     TextOverflow
                              //                                         .ellipsis,
                              //                                 style: TextStyle(
                              //                                   fontFamily:
                              //                                       "HelveticaBold",
                              //                                   color: Colors
                              //                                       .black,
                              //                                   fontSize:
                              //                                       width *
                              //                                           0.05,
                              //                                   fontWeight:
                              //                                       FontWeight
                              //                                           .w600,
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           Text(
                              //                             // 'Home Removals (est. 15.12 m3, 2 men)',
                              //                             '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                              //                             style: TextStyle(
                              //                               fontFamily:
                              //                                   "HelveticaRegular",
                              //                               color: Colors.black,
                              //                               fontSize:
                              //                                   width * 0.036,
                              //                             ),
                              //                           ),
                              //                         ]),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //           const Divider(
                              //             thickness: 2,
                              //           )
                              //         ],
                              //       );
                              //     } else {
                              //       return const SizedBox();
                              //     }
                              //   }),
                              // )
                            ],
                          );
                        }),
                  ],
                )),
          )),
    );
  }
}
