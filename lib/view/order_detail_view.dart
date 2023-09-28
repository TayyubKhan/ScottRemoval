// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:scotremovals/model/WonJobModel.dart';
import 'package:scotremovals/repository/image.dart';
import 'package:scotremovals/repository/pickuprepo.dart';
import 'package:scotremovals/res/Components/Call_and_Message.dart';
import 'package:scotremovals/res/Components/CardComponents.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view/signature_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/dropoutrepo.dart';
import '../repository/home_repo.dart';
import '../repository/orderDetailsRepo.dart';
import '../repository/withourmodel_repo.dart';
import '../res/colors.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/dataViewModel.dart';

// ignore: camel_case_types
class Order_Detail extends StatefulWidget {
  const Order_Detail({super.key});

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {
  WithoutModelRepo withoutModelRepo = WithoutModelRepo();
  HomeRepository homeRepository = HomeRepository();
  Calland_message calland_message = Calland_message();
  DropOutRepo dr = DropOutRepo();
  PickupRepo pk = PickupRepo();
  Future<void> fetchData() async {
    homeRepository.fetchData(context);
  }

  LatLng startlatlng = const LatLng(0, 0);
  LatLng destlatlng = const LatLng(0, 0);

  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  late BitmapDescriptor customIcon;

  Future<void> _createCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
          size:
              Size(20, 20)), // Adjust the size to match your icon's dimensions
      'assets/icon.png',
    ).then((icon) {
      customIcon = icon;
    });
  }

  bool isButtonClickable(String date) {
    DateTime time = DateTime.parse(date);
    DateTime futureTime = time.add(const Duration(hours: 48));
    return DateTime.now().isAfter(futureTime);
  }

  ScrollController scrollController = ScrollController();
  Future<void> _addMarkers() async {
    await _createCustomMarkerIcon();
    _markers.add(Marker(
      icon: customIcon,
      markerId: const MarkerId('start'),
      position: startlatlng,
      infoWindow: const InfoWindow(title: 'Start'),
    ));

    _markers.add(Marker(
      markerId: const MarkerId('dest'),
      position: destlatlng,
      infoWindow: const InfoWindow(title: 'Destination'),
    ));
  }

  Future<void> _getPolylines() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      List<LatLng> polylineCoordinates = [];
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os",
        PointLatLng(startlatlng.latitude, startlatlng.longitude),
        PointLatLng(destlatlng.latitude, destlatlng.longitude),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      }
      _polylines.add(
        Polyline(
          width: 4,
          polylineId: const PolylineId('route1'),
          color: BC.blue,
          points: polylineCoordinates,
        ),
      );
      // setState(() {});
    } catch (e) {
      startlatlng = const LatLng(0.00, 0.00);
      destlatlng = const LatLng(0.00, 0.00);
    }
  }

  List<Map<String, dynamic>> dataList = [];
  @override
  Widget build(BuildContext context) {
    final order = OrderDetailRepo();
    int total = 0;
    final data = Provider.of<DataViewViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    int index = int.parse(data.data[3]);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.home);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BC.login,
          toolbarHeight: height * 0.08,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.home);
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
                  snapshot.data!.data![index].trackingID,
                  style: TextStyle(
                      fontSize: width * 0.067,
                      fontFamily: "HelveticaBold",
                      color: BC.white),
                );
              }
              return const Center(
                  child: CircularProgressIndicator(color: BC.blue));
            },
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // await homeRepository.fetchData(context);
            setState(() {});
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        FutureBuilder<WonJobModel>(
                          future: homeRepository.fetchData(context),
                          builder: (BuildContext context, snapshot) {
                            try {
                              bool showProgress = true;

                              Timer(const Duration(seconds: 20), () {
                                if (snapshot.connectionState ==
                                        ConnectionState.active ||
                                    snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                  // If the Future is still ongoing after 20 seconds, change showProgress to false
                                  setState(() {
                                    showProgress = false;
                                  });
                                }
                              });

                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                // Data has been loaded
                                showProgress = false;
                              }

                              if (snapshot.hasData) {
                                try {
                                  startlatlng = LatLng(
                                      double.parse(snapshot
                                          .data!.data![index].pickupLatitude!),
                                      double.parse(snapshot.data!.data![index]
                                          .pickupLongitude!));
                                  destlatlng = LatLng(
                                      double.parse(snapshot
                                          .data!.data![index].dropLatitude!),
                                      double.parse(snapshot
                                          .data!.data![index].dropLongitude!));
                                } catch (e) {
                                  startlatlng = const LatLng(0.00, 0.00);
                                  destlatlng = const LatLng(0.00, 0.00);
                                }
                                if (kDebugMode) {
                                  print(destlatlng.latitude);
                                }
                                List<Map<String, dynamic>> dt = [];
                                if (snapshot.data!.data![index].productsList!
                                    .toString()
                                    .isNotEmpty) {
                                  dt = List<Map<String, dynamic>>.from(
                                      jsonDecode(snapshot
                                          .data!.data![index].productsList!
                                          .toString()));
                                }
                                dataList = dt;
                                total = 0;
                                for (int j = 0; j < dataList.length; j++) {
                                  total = total +
                                      int.parse(dataList[j]['quantity']);
                                }

                                _getPolylines();
                                _addMarkers();
                                log('${snapshot.data!.data![index].orderDate}T${snapshot.data!.data![index].strtTime}');
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: SizedBox(
                                          height: height * 0.25,
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              GoogleMap(
                                                  gestureRecognizers: <Factory<
                                                      OneSequenceGestureRecognizer>>{
                                                    Factory<EagerGestureRecognizer>(
                                                        () =>
                                                            EagerGestureRecognizer()),
                                                  }.toSet(),
                                                  zoomControlsEnabled: false,
                                                  mapType: MapType.normal,
                                                  markers: _markers,
                                                  initialCameraPosition:
                                                      CameraPosition(
                                                          target: LatLng(
                                                              startlatlng
                                                                  .latitude,
                                                              startlatlng
                                                                  .longitude),
                                                          zoom: 8),
                                                  polylines: _polylines,
                                                  onMapCreated:
                                                      (GoogleMapController
                                                          controller) async {
                                                    dynamic imageResponse =
                                                        await http.get(Uri.parse(
                                                            'https://scotremovals.com/api/assets/order_signatures/${snapshot.data!.data![index].signature}'));
                                                    if (imageResponse
                                                            .bodyBytes !=
                                                        null) {
                                                      data.setSignatureBytes(
                                                          imageResponse
                                                              .bodyBytes,
                                                          index);
                                                    }
                                                    dynamic response =
                                                        await order
                                                            .orderDetailApi(
                                                                context);
                                                    data.getdata(
                                                        response['waiver_form'][
                                                                response['waiver_form']
                                                                        .length -
                                                                    1]['waiver_description']
                                                            .toString(),
                                                        index);
                                                    data.getdata2(
                                                        response['comments'][
                                                                response['comments']
                                                                        .length -
                                                                    1]['messege']
                                                            .toString(),
                                                        index);
                                                    _controller
                                                        .complete(controller);
                                                  }),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FloatingActionButton(
                                                  backgroundColor: BC.blue,
                                                  onPressed: () async {
                                                    GoogleMapController
                                                        googleController =
                                                        await _controller
                                                            .future;
                                                    googleController.animateCamera(
                                                        CameraUpdate.newCameraPosition(
                                                            CameraPosition(
                                                                tilt: 5,
                                                                target: LatLng(
                                                                    destlatlng
                                                                        .latitude,
                                                                    destlatlng
                                                                        .longitude),
                                                                zoom: 8.5)));
                                                    setState(() {});
                                                  },
                                                  child: const ImageIcon(
                                                      AssetImage(
                                                          'assets/icon2.png')),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      'DUE ${snapshot.data!.data![index].endTime.toString().substring(0, 5)}',
                                                      style: TextStyle(
                                                          color: BC.white,
                                                          fontSize:
                                                              width * 0.04),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: data.status == true
                                                          ? BC.green
                                                          : Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      data.status == true
                                                          ? 'PICKUP'
                                                          : 'Drop Off',
                                                      style: TextStyle(
                                                          color: BC.white,
                                                          fontSize:
                                                              width * 0.04),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              width: width,
                                              child: Text(
                                                data.status == true
                                                    ? snapshot
                                                        .data!
                                                        .data![index]
                                                        .pickupAddress
                                                        .toString()
                                                    : snapshot
                                                        .data!
                                                        .data![index]
                                                        .deliveryAddress
                                                        .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    fontFamily: "HelveticaBold",
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Scheduled For',
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.045,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      snapshot.data!
                                                          .data![index].strtTime
                                                          .toString()
                                                          .substring(0, 5),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.045,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ETA',
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.045,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      snapshot.data!
                                                          .data![index].endTime
                                                          .toString()
                                                          .substring(0, 5),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.045,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text('Contact'),
                                                          Text(
                                                            data.status == true
                                                                ? snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .pickupName
                                                                    .toString()
                                                                : snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .deliveryName
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "HelveticaBold",
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.045,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: isButtonClickable(
                                                                '${snapshot.data!.data![index].orderDate}T${snapshot.data!.data![index].strtTime}')
                                                            ? () {
                                                                data.status ==
                                                                        true
                                                                    ? calland_message.makeMessage(snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .pickupPhone
                                                                        .toString())
                                                                    : calland_message.makeMessage(snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .deliveryPhone
                                                                        .toString());
                                                              }
                                                            : () {
                                                                Utilis.error_flushbar_message(
                                                                    context,
                                                                    'Will be available after 48 hours');
                                                              },
                                                        child: const Image(
                                                          image: AssetImage(
                                                              'assets/comment.png'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: width * 0.05),
                                                      InkWell(
                                                        onTap: isButtonClickable(
                                                                '${snapshot.data!.data![index].orderDate}T${snapshot.data!.data![index].strtTime}')
                                                            ? () {
                                                                data.status ==
                                                                        true
                                                                    ? calland_message.makePhoneCall(snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .pickupPhone
                                                                        .toString())
                                                                    : calland_message.makePhoneCall(snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .deliveryPhone
                                                                        .toString());
                                                              }
                                                            : () {
                                                                Utilis.error_flushbar_message(
                                                                    context,
                                                                    'Will be available after 48 hours');
                                                              },
                                                        child: const Image(
                                                          image: AssetImage(
                                                              'assets/phone.png'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            Text(
                                              'Order Description',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: width * 0.05,
                                              ),
                                            ),
                                            Text(
                                              data.data[1],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: width * 0.04,
                                                fontFamily: "HelveticaBold",
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: width * 0.2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Order',
                                                          style: TextStyle(
                                                              fontSize: width *
                                                                  0.045),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.01,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.6,
                                                          height: height * 0.2,
                                                          child:
                                                              ListView.builder(
                                                            itemCount:
                                                                dataList.length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              if (dataList
                                                                  .isNotEmpty) {
                                                                return Row(
                                                                  children: [
                                                                    const Image(
                                                                      image: AssetImage(
                                                                          'assets/item.png'),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.01,
                                                                    ),
                                                                    Text(
                                                                      dataList[i]
                                                                              [
                                                                              'quantity'] +
                                                                          ' x ' +
                                                                          dataList[i]['name']
                                                                              .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "HelveticaRegular",
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            width *
                                                                                0.04,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.03,
                                                                    )
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Total Items: ',
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04),
                                                      ),
                                                      Text(
                                                        total.toString(),
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "HelveticaBold",
                                                            fontSize:
                                                                width * 0.04),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (showProgress) {
                                // Show CircularProgressIndicator while loading
                                return SizedBox(
                                    height: height,
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                            color: BC.blue)));
                              } else {
                                return const Text(
                                    'Check Your Internet Connection');
                              }
                            } catch (e) {
                              return SizedBox(
                                  height: height,
                                  child: const Center(
                                      child: Text(
                                    'There is Issue from the server',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )));
                            }
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<AuthViewModelProvider>(
                              builder: (context, value, child) {
                            return Rounded_Button2(
                              loading: value.loading,
                              width: width * 0.7,
                              height: height * 1,
                              title: data.status == true
                                  ? 'Complete PICKUP'
                                  : 'Complete DROPOFF',
                              onPress: () async {
                                value.setLoading(true);
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                data.status == true
                                    ? await pk.PickupApi(context, '1',
                                        sp.getString('orderId').toString())
                                    : await dr.DropApi(context, '1',
                                        sp.getString('orderId').toString());
                                Navigator.pushNamed(context, RoutesName.home);
                                value.setLoading(false);
                              },
                            );
                          }),
                          InkWell(
                            onTap: () {
                              data.setAPIData(dataList);
                              if (kDebugMode) {
                                print(data.status);
                              }
                              dialogBox(context, data);
                            },
                            child: Container(
                                width: width * 0.2,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: BC.login),
                                child: Center(
                                  child: Center(
                                    child: Text('+',
                                        style: TextStyle(
                                            color: BC.textcolor,
                                            fontSize: width * 0.06,
                                            fontFamily: "HelveticaBold")),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  dialogBox(BuildContext context, data) {
    GetImageData get = GetImageData();
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
                                get.fun(data, context);
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Signature_View()));
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
