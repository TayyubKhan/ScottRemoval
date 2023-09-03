// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/Order_Images_repo.dart';
import 'package:scotremovals/res/Components/Photo_Component.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/res/Components/cameraComponent.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/GetImage.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../view_model/auth_view_model.dart';

class Add_Photo_View extends StatefulWidget {
  final List<CameraDescription> cameras = [];
  Add_Photo_View({super.key}) {
    availableCameras().then((availableCameras) {
      cameras.addAll(availableCameras);
    });
  }
  @override
  _Add_Photo_ViewState createState() => _Add_Photo_ViewState();
}

Future<dynamic> func(context) async {
  GetImage image = GetImage();
  List<File> imageFiles = [];
  dynamic jsonResponse = await image.getImage(context);
  return jsonResponse;
}

class _Add_Photo_ViewState extends State<Add_Photo_View> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    availableCameras();
  }

  OrderImages orderImages = OrderImages();
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataViewViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.singleOrder);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: BC.white,
              )),
          toolbarHeight: height * 0.08,
          backgroundColor: BC.blue,
          title: Text(
            'Add Photo ',
            style: TextStyle(
                color: BC.white,
                fontSize: width * 0.067,
                fontFamily: "HelveticaBold"),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: func(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List urls = [];

                for (int i = 0; i < snapshot.data['data'].length; i++) {
                  String url = snapshot.data['base_url'].toString() +
                      snapshot.data['data'][i]['image_path'].toString() +
                      snapshot.data['data'][i]['image'].toString();
                  if (!urls.contains(url)) {
                    urls.add(url);
                  }
                }

                urls = urls.reversed.toList();
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please add the photo of item/s if it is already damaged or if you doubt about any product. ',
                        style: TextStyle(
                            fontFamily: "HelveticaRegular",
                            fontSize: width * 0.048,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Add Images',
                        style: TextStyle(
                            fontFamily: "HelveticaBold",
                            fontSize: width * 0.048,
                            color: BC.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: height * 0.6,
                        child: GridView.builder(
                          itemCount: 12,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                final camera = widget.cameras.isNotEmpty
                                    ? widget.cameras[0]
                                    : null;
                                final image = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CameraComponent(camera: camera!),
                                  ),
                                );
                                if (image != null) {
                                  setState(() {
                                    // If an image was captured, update the imageFiles list at the tapped index.
                                    if (imageFiles.length > index) {
                                      imageFiles.insert(index, image);
                                    } else {
                                      imageFiles.add(image);
                                    }
                                  });
                                }
                              },
                              child: IntrinsicWidth(
                                child: Container(
                                    color: Colors.white,
                                    child: imageFiles.length > index ||
                                            urls.length <= index
                                        ? imageFiles.length > index
                                            ? Image.file(imageFiles[index],
                                                errorBuilder:
                                                    (context, error, stack) {
                                                return const Photo_Component();
                                              })
                                            : const Photo_Component()
                                        : Image.network(urls[index],
                                            errorBuilder:
                                                (context, error, stack) {
                                            return const Photo_Component();
                                          })),
                              ),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Consumer<AuthViewModelProvider>(
                          builder: (context, value, child) {
                            return Rounded_Button2(
                              width: width * 0.9,
                              loading: value.loading,
                              height: height * 1,
                              title: "DONE",
                              onPress: () async {
                                // value.setLoading(value.setLoading(!value.loading));
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                value.setLoading(true);
                                log(sp.get('orderId').toString());
                                await orderImages
                                    .sendOrderImages(context, imageFiles,
                                        sp.get('orderId').toString())
                                    .then((v) {
                                  value.setLoading(false);
                                  Navigator.pushNamed(
                                      context, RoutesName.singleOrder);
                                }).onError((error, stackTrace) {
                                  value.setLoading(false);
                                });
                                value.setLoading(false);
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox(
                    height: height,
                    child: const Center(
                        child: CircularProgressIndicator(color: BC.blue)));
              }
            },
          ),
        ),
      ),
    );
  }
}
