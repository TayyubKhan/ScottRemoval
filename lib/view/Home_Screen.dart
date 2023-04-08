import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/model/WonJobModel.dart';
import 'package:scotremovals/repository/home_repo.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

import '../res/Components/myDrawer.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../view_model/user_view_model.dart';

// ignore: camel_case_types
class Home_screen_View extends StatefulWidget {
  const Home_screen_View({Key? key}) : super(key: key);

  @override
  State<Home_screen_View> createState() => _Home_screen_ViewState();
}

class _Home_screen_ViewState extends State<Home_screen_View> {
  HomeRepository homeRepository = HomeRepository();
  @override
  int selectedIndex = 0;
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
    final dvv = Provider.of<DataViewViewModel>(context);
    final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    final Userprefrences = Provider.of<UserViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        // Return true to allow back navigation, or false to disable it
        return false;
      },
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: Scaffold(
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
                    fontSize: width * 0.067,
                    fontFamily: "HelveticaBold",
                    color: BC.white),
              ),
              centerTitle: true,
              actions: [
                const Icon(
                  Icons.search,
                  color: BC.white,
                ),
                SizedBox(
                  width: width * 0.047,
                ),
              ],
            ),
            body: FutureBuilder<WonJobModel>(
                future: homeRepository.fetchData(context),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: snapshot.data!.orderCount,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                String desc =
                                    '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()},${snapshot.data!.data![index].persons.toString()} men)';
                                dvv.setData([
                                  snapshot.data!.data![index].deliveryAddress
                                      .toString(),
                                  desc.toString(),
                                  snapshot.data!.data![index].id.toString(),
                                  index.toString()
                                ]);
                                Navigator.pushNamed(
                                    context, RoutesName.singleOrder);
                              },
                              child: SizedBox(
                                width: width,
                                height: height * 0.1,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? BC.green
                                              : BC.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: width * 0.96,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!.data![index]
                                                      .orderId
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "HelveticaRegular",
                                                    color: BC.lightGrey,
                                                    fontSize: width * 0.038,
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: BC.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .data![index]
                                                          .orderStatus
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: BC.white,
                                                          fontSize:
                                                              width * 0.036),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  snapshot.data!.data![index]
                                                      .deliveryAddress
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: "HelveticaBold",
                                                    color: Colors.black,
                                                    fontSize: width * 0.05,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // 'Home Removals (est. 15.12 m3, 2 men)',
                                              '${snapshot.data!.data![index].orderType.toString()}(est. ${snapshot.data!.data![index].productVolume.toString()} m3,${snapshot.data!.data![index].persons.toString()} men)',
                                              style: TextStyle(
                                                fontFamily: "HelveticaRegular",
                                                color: Colors.black,
                                                fontSize: width * 0.036,
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
                        );
                      }),
                    );
                  }
                  return Container(
                      child: Center(child: const CircularProgressIndicator()));
                })),
      ),
    );
  }
}
