// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:io';
import 'dart:typed_data';

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
import '../repository/imageupdaterepo.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';
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
  final up = UpdateImage();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    availableCameras();
  }

  OrderImages orderImages = OrderImages();
  List<File> imageFiles = List<File>.filled(12, File(''));
  List<File> imageFiles2 = [];

  List<File> singleImage = [];

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
                List imageID = [];
                for (int i = 0; i < snapshot.data['data'].length; i++) {
                  String url = snapshot.data['base_url'].toString() +
                      snapshot.data['data'][i]['image_path'].toString() +
                      snapshot.data['data'][i]['image'].toString();
                  String imageid = snapshot.data['data'][i]['id'].toString();
                  if (!urls.contains(url)) {
                    urls.add(url);
                    imageID.add(imageid);
                  }
                }
                urls = urls.reversed.toList();
                imageID = imageID.reversed.toList();
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
                                      imageFiles[index] = image;
                                    } else {
                                      imageFiles[index] = image;
                                      imageFiles2.add(image);
                                      // imageFiles.add(image);
                                    }
                                  });
                                }
                              },
                              child: IntrinsicWidth(
                                child: Container(
                                    color: Colors.white,
                                    child: (urls.isNotEmpty &&
                                            index < urls.length)
                                        ? Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ImageDialog(
                                                            urls[index]);
                                                      },
                                                    );
                                                  },
                                                  child: Image.network(
                                                    urls[index],
                                                    errorBuilder: (context,
                                                        error, stack) {
                                                      return const Photo_Component();
                                                    },
                                                  )),
                                              PopupMenuButton(
                                                  color: BC.blue,
                                                  itemBuilder: (context) => [
                                                        PopupMenuItem(
                                                            child: ListTile(
                                                          onTap: () async {
                                                            SharedPreferences
                                                                sp =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            final camera = widget
                                                                    .cameras
                                                                    .isNotEmpty
                                                                ? widget
                                                                    .cameras[0]
                                                                : null;
                                                            File image =
                                                                await Navigator.of(
                                                                        context)
                                                                    .push(
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    CameraComponent(
                                                                        camera:
                                                                            camera!),
                                                              ),
                                                            );
                                                            Uint8List bytes;
                                                            bytes = await image
                                                                .readAsBytes();
                                                            await up
                                                                .updateOrderImage(
                                                                    context,
                                                                    image,
                                                                    sp
                                                                        .get(
                                                                            'orderId')
                                                                        .toString(),
                                                                    imageID[
                                                                        index])
                                                                .then((value) {
                                                              Utilis.Snackbar_Message(
                                                                  context,
                                                                  'Image Updated');
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              Utilis.Snackbar_ErrorMessage(
                                                                  context,
                                                                  'Error while updating');
                                                            });
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          leading: const Text(
                                                              'Update',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        )),
                                                        PopupMenuItem(
                                                            child: ListTile(
                                                          onTap: () async {
                                                            await up
                                                                .deleteOrderImage(
                                                                    context,
                                                                    imageID[
                                                                        index])
                                                                .then((value) {
                                                              Utilis.Snackbar_Message(
                                                                  context,
                                                                  'Image Deleted');
                                                              imageID.removeAt(
                                                                  index);
                                                              urls.removeAt(
                                                                  index);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {});
                                                          },
                                                          leading: const Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        )),
                                                      ]),
                                            ],
                                          )
                                        : (index < imageFiles.length)
                                            ? Image.file(imageFiles[index],
                                                errorBuilder:
                                                    (context, error, stack) {
                                                return const Photo_Component();
                                              })
                                            : const Photo_Component()),
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
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                value.setLoading(true);
                                imageFiles2 = [];
                                for (int i = 0; i < imageFiles.length; i++) {
                                  bool value = await imageFiles[i].exists();
                                  if (value == true) {
                                    imageFiles2.add(imageFiles[i]);
                                  }
                                }
                                await orderImages
                                    .sendOrderImages(context, imageFiles2,
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

class ImageDialog extends StatelessWidget {
  final String imageUrl;

  ImageDialog(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () {
          // Close the dialog when tapped outside the image.
          Navigator.of(context).pop();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}

// In your build method where you display the images:
// Container(
// color: Colors.white,
// child: imageFiles.length > index ||
// urls.length <= index
// ? imageFiles.length > index
// ? Image.file(imageFiles[index],
// errorBuilder:
// (context, error, stack) {
// return const Photo_Component();
// })
//     : const Photo_Component()
//     : Stack(
// alignment: Alignment.bottomRight,
// children: [
// GestureDetector(
// onTap: () {
// showDialog(
// context: context,
// builder: (BuildContext
// context) {
// return ImageDialog(
// urls[index]);
// },
// );
// },
// child: Image.network(
// urls[index],
// errorBuilder: (context,
// error, stack) {
// return const Photo_Component();
// },
// )),
// PopupMenuButton(
// color: BC.blue,
// itemBuilder: (context) => [
// PopupMenuItem(
// child: ListTile(
// onTap: () async {
// SharedPreferences
// sp =
// await SharedPreferences
//     .getInstance();
// final camera = widget
//     .cameras
//     .isNotEmpty
// ? widget
//     .cameras[0]
//     : null;
// File image =
// await Navigator.of(
// context)
//     .push(
// MaterialPageRoute(
// builder: (context) =>
// CameraComponent(
// camera:
// camera!),
// ),
// );
// Uint8List bytes;
// bytes = await image
//     .readAsBytes();
// await up
//     .updateOrderImage(
// context,
// image,
// sp
//     .get(
// 'orderId')
//     .toString(),
// imageID[
// index])
//     .then((value) {
// Utilis.Snackbar_Message(
// context,
// 'Image Updated');
// }).onError((error,
// stackTrace) {
// Utilis.Snackbar_ErrorMessage(
// context,
// 'Error while updating');
// });
// setState(() {});
// Navigator.pop(
// context);
// },
// leading: const Text(
// 'Update',
// style: TextStyle(
// color: Colors
//     .white,
// fontWeight:
// FontWeight
//     .bold)),
// )),
// PopupMenuItem(
// child: ListTile(
// onTap: () async {
// await up
//     .deleteOrderImage(
// context,
// imageID[
// index])
//     .then((value) {
// Utilis.Snackbar_Message(
// context,
// 'Image Deleted');
// imageID.removeAt(
// index);
// urls.removeAt(
// index);
// });
// setState(() {});
// Navigator.pop(
// context);
// },
// leading: const Text(
// 'Delete',
// style: TextStyle(
// color: Colors
//     .white,
// fontWeight:
// FontWeight
//     .bold)),
// )),
// ]),
// ],
// ))
