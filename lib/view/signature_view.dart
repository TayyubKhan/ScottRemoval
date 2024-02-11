// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../repository/signature_repo.dart';
import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';

class Signature_View extends StatefulWidget {
  const Signature_View({super.key});
  @override
  State<Signature_View> createState() => _Signature_ViewState();
}

class _Signature_ViewState extends State<Signature_View>
    with AutomaticKeepAliveClientMixin {
  bool show = true;
  SignatureRepo signatureRepo = SignatureRepo();
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    show = false;
  }

  // Future signatureimage() async{
  //   dynamic imageResponse =
  //       await http.get(Uri.parse(
  //       'https://scotremovals.com/api/assets/order_signatures/${snapshot.data!.data![index].signature}'));
  //   if (imageResponse.bodyBytes !=
  //       null) {
  //     data.setSignatureBytes(
  //         imageResponse.bodyBytes,
  //         index);
  //   }
  //   dynamic response = await order
  //       .orderDetailApi(context);
  //   data.getdata(
  //       response[
  //       'waiver_form'][response[
  //       'waiver_form']
  //           .length -
  //           1]['waiver_description']
  //           .toString(),
  //       index);
  //   data.getdata2(
  //       response['comments'][
  //       response['comments']
  //           .length -
  //           1]['messege']
  //           .toString(),
  //       index);
  // }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool draw = false;
    final data = Provider.of<DataViewViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
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
        body: SingleChildScrollView(
          child: PageStorage(
            bucket: PageStorageBucket(),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please sign below to acknowledge receipt of item/s specified on your Booking Conformation.',
                    style: TextStyle(fontFamily: "HelveticaBold", fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      draw = false;
                      show = true;
                      setState(() {});
                      _signaturePadKey.currentState!.clear();
                    },
                    child: const Text(
                      'Clear Signature',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: BC.blue),
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
                              child: show == true
                                  ? SfSignaturePad(
                                      onDrawStart: () {
                                        draw = true;
                                        return false;
                                      },
                                      key: _signaturePadKey,
                                    )
                                  : InkWell(
                                      onTap: () {
                                        show = true;
                                        setState(() {});
                                      },
                                      child: Image.memory(
                                          data.signature[data.index]!))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
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
                            final signatureData =
                                await _signaturePadKey.currentState?.toImage();
                            final bytes = await signatureData?.toByteData(
                                format: ImageByteFormat.png);
                            Uint8List pngBytes;
                            pngBytes = bytes!.buffer.asUint8List();
                            Provider.of<DataViewViewModel>(context,
                                    listen: false)
                                .setSignatureBytes(pngBytes, data.index);

                            value.setLoading(true);
                            dynamic valid = await signatureRepo
                                .signatureAPI(context,
                                    sp.get('orderId').toString(), pngBytes)
                                .timeout(const Duration(seconds: 10),
                                    onTimeout: () =>
                                        Utilis.error_flushbar_message(
                                            context, 'Time Out'));
                            value.setLoading(false);
                            if (valid == true) {
                              Navigator.pushReplacementNamed(
                                  context, RoutesName.singleOrder);
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
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
