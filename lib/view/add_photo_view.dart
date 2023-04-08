import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/Order_Images_repo.dart';
import 'package:scotremovals/res/Components/Photo_Component.dart';
import 'package:scotremovals/res/Components/Rounded_Button.dart';
import 'package:scotremovals/res/Components/cameraComponent.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';

import '../res/colors.dart';
import '../view_model/auth_view_model.dart';

class Add_Photo_View extends StatefulWidget {
  final List<CameraDescription> cameras = [];
  Add_Photo_View({super.key}) {
    // Fetch available cameras
    availableCameras().then((availableCameras) {
      cameras.addAll(availableCameras);
    });
  }
  @override
  _Add_Photo_ViewState createState() => _Add_Photo_ViewState();
}

class _Add_Photo_ViewState extends State<Add_Photo_View> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    availableCameras();
  }

  DataViewViewModel data = DataViewViewModel();
  OrderImages orderImages = OrderImages();
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Camera Demo'),
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
              height: height * 0.65,
              child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        // Launch the camera
                        final camera = widget.cameras.length > 0
                            ? widget.cameras[0]
                            : null;
                        final image = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                CameraComponent(camera: camera!),
                          ),
                        );
                        // Display the captured image
                        if (image != null) {
                          setState(() {
                            imageFiles.add(image);
                          });
                        }
                      },
                      child: Card(
                          child: imageFiles.length > index
                              ? Image.file(imageFiles[index])
                              : Photo_Component()),
                    );
                  }),
            ),
            Center(
              child: Consumer<AuthViewModelProvider>(
                builder: (context, value, child) {
                  return Rounded_Button2(
                    width: width * 0.9,
                    loading: value.loading,
                    height: height * 1,
                    title: "DONE",
                    onPress: () {
                      if (orderImages.sendOrderImages(
                              context, imageFiles, data.data[2]) ==
                          true) {
                        value.setLoading(value.setLoading(!value.loading));
                        Navigator.pushNamed(context, RoutesName.signature);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
