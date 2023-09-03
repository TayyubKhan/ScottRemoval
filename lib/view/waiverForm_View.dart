// ignore_for_file: use_build_context_synchronously, prefer_final_fields, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/res/app_url.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/waiver_Form_repo.dart';
import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';
import '../view_model/auth_view_model.dart';

class Waiver_Form_View extends StatefulWidget {
  const Waiver_Form_View({super.key});

  @override
  State<Waiver_Form_View> createState() => _Waiver_Form_ViewState();
}

class _Waiver_Form_ViewState extends State<Waiver_Form_View> {
  Waive_Form_Repository wf = Waive_Form_Repository();
  String text = 'adfasdf';
  TextEditingController _controller = TextEditingController(text: 'a');
  DataViewViewModel d = DataViewViewModel();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    final dataa = Provider.of<DataViewViewModel>(context, listen: false);
    if (dataa.wavdata[dataa.index] != null) {
      if (dataa.wavdata[dataa.index] != '') {
        _controller = TextEditingController(text: dataa.wavdata[dataa.index]);
      }
    }
  }

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
          toolbarHeight: height * 0.08,
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
            'Liability Waiver Form',
            style: TextStyle(
              color: BC.white,
              fontSize: width * 0.067,
              fontFamily: "HelveticaBold",
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In the event of something being damaged as a result of the item move, such as damage to the collection or delivery property, you hereby agree that our liability to you is waivered. Signing ths Liability Waiver Form is in accordance with Ts&Cs found on our website.',
                          style: TextStyle(
                              fontFamily: "HelveticaRegular",
                              fontSize: width * 0.048,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'If you do not wish to sign this waiver form, please call the Scot Removals office.',
                          style: TextStyle(
                              fontFamily: "HelveticaRegular",
                              fontSize: width * 0.048,
                              color: BC.lightGrey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<DataViewViewModel>(
                            builder: (context, value, child) {
                          return TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.name,
                            maxLines: 10,
                            style: TextStyle(
                              fontFamily: "HelveticaRegular",
                              fontSize: width * 0.048,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          );
                        }),
                        SizedBox(
                          height: height * 0.33,
                        ),
                        Center(
                          child: Consumer<AuthViewModelProvider>(
                            builder: (BuildContext context, value, child) {
                              return Rounded_Button2(
                                  width: width * 0.9,
                                  height: height * 1,
                                  title: "DONE",
                                  loading: value.loading,
                                  onPress: () async {
                                    SharedPreferences sp =
                                        await SharedPreferences.getInstance();
                                    if (_controller.text.isNotEmpty) {
                                      value.setLoading(true);
                                      dynamic abc = await wf
                                          .waiverFormApi(
                                              context,
                                              AppUrl.waiverFormApiEndPoint,
                                              _controller.text.toString(),
                                              sp.get('orderId').toString()!)
                                          .onError((error, stackTrace) => {
                                                Utilis.error_flushbar_message(
                                                    context, error.toString())
                                              })
                                          .timeout(const Duration(seconds: 10),
                                              onTimeout: () =>
                                                  Utilis.error_flushbar_message(
                                                      context, 'Time Out'));
                                      value.setLoading(false);
                                      if (abc == true) {
                                        Navigator.pushNamed(
                                            context, RoutesName.singleOrder);
                                      }
                                    } else {
                                      Utilis.error_flushbar_message(
                                          context, 'Please Enter Form');
                                    }
                                  });
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
