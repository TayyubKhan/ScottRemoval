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
  Widget build(BuildContext context) {
    super.build(context);
    bool draw = false;
    final signature = Provider.of<SignatureProvider>(context, listen: false);
    final data = Provider.of<DataViewViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.singleOrder);
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
        body: PageStorage(
          bucket: PageStorageBucket(),
          child: Container(
            padding: const EdgeInsets.all(20),
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
                    draw = false;
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
                            child: draw == false && signature.show == true
                                ? SfSignaturePad(
                                    onDrawStart: () {
                                      draw = true;
                                      return false;
                                    },
                                    key: _signaturePadKey,
                                  )
                                : InkWell(
                                    onTap: () {
                                      signature.setshow(true);
                                      setState(() {});
                                    },
                                    child:
                                        Image.memory(signature.signatureBytes!))),
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
                          Provider.of<SignatureProvider>(context, listen: false)
                              .setSignatureBytes(pngBytes);
                          signature.setshow(false);
                          if (draw == true) {
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
                              Navigator.pushNamed(
                                  context, RoutesName.singleOrder);
                            }
                          } else {
                            draw == false && signature.show == true
                                ? Utilis.error_flushbar_message(
                                    context, 'Please Sign')
                                : Utilis();
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SignatureProvider with ChangeNotifier {
  Uint8List? _signatureBytes;
  bool _show = true;

  bool get show => _show;

  Uint8List? get signatureBytes => _signatureBytes;

  void setSignatureBytes(Uint8List bytes) {
    _signatureBytes = bytes;
    notifyListeners();
  }

  void setshow(bool show) {
    _show = show;
    notifyListeners();
  }
}
