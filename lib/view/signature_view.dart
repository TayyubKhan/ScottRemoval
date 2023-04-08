import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../repository/signature_repo.dart';
import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';

class Signature_View extends StatefulWidget {
  @override
  State<Signature_View> createState() => _Signature_ViewState();
}

class _Signature_ViewState extends State<Signature_View> {
  SignatureRepo signatureRepo = SignatureRepo();
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  String _responseMessage = '';
  DataViewViewModel data = DataViewViewModel();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
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
          'Ask For Signature',
          style: TextStyle(
            color: BC.white,
            fontSize: width * 0.067,
            fontFamily: "HelveticaBold",
          ),
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
            const Text(
              'Please sign below to acknowledge receipt of item/s specified on your Booking Conformation.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _signaturePadKey.currentState!.clear();
              },
              child: const Text(
                'Clear Signature',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15, color: BC.blue),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.6,
              width: width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: SfSignaturePad(
                        key: _signaturePadKey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Consumer<AuthViewModelProvider>(
                builder: (context, value, child) {
                  return Rounded_Button2(
                    width: width * 0.9,
                    height: height * 1,
                    loading: value.loading,
                    title: "DONE",
                    onPress: () async {
                      final signatureData =
                          await _signaturePadKey.currentState?.toImage();
                      final bytes = await signatureData?.toByteData(
                          format: ImageByteFormat.png);
                      final Uint8List pngBytes = bytes!.buffer.asUint8List();
                      if (signatureRepo.signatureAPI(
                              context, data.data[3], pngBytes) ==
                          true) {
                        value.setLoading(value.setLoading(!value.loading));
                        Navigator.pushNamed(context, RoutesName.comment);
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
