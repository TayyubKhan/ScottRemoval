import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/constant/colors.dart';

import '../res/Components/Rounded_Button.dart';
import '../res/Components/fonts.dart';
import '../res/app_url.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecureText = ValueNotifier<bool>(true);
  FocusNode emailfoucs = FocusNode();
  FocusNode passwordfocus = FocusNode();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailfoucs.dispose();
    passwordfocus.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    obsecureText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodelprovider = Provider.of<AuthViewModelProvider>(context);
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(children: [
            Container(
              height: height * 0.391,
              width: width,
              color: BC.login,
              child: Center(
                child: SizedBox(
                  height: height * 0.5,
                  width: width * 0.6,
                  child: const Image(
                    image: AssetImage("assets/logo2.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.078,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s Sign You In",
                      style: Fonts.bold,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      "Welcome back, you’ve been missed!",
                      style: TextStyle(
                          fontFamily: "HelveticaRegular", color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    TextFormField(
                      onTapOutside: (value) {
                        passwordfocus.unfocus();
                      },
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        Utilis.fieldocusnode(
                            context, emailfoucs, passwordfocus);
                      },
                      focusNode: emailfoucs,
                      controller: _emailcontroller,
                      decoration: const InputDecoration(
                          labelText: "Username or Email",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(),
                          alignLabelWithHint: false,
                          hintText: "Username or Email",
                          prefixIcon: ImageIcon(
                            AssetImage("assets/person.png"),
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    ValueListenableBuilder(
                        valueListenable: obsecureText,
                        builder: (context, value, child) {
                          return TextFormField(
                              onTapOutside: (value) {
                                passwordfocus.unfocus();
                              },
                              focusNode: passwordfocus,
                              controller: _passwordcontroller,
                              obscureText: obsecureText.value,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                focusedBorder: const UnderlineInputBorder(),
                                alignLabelWithHint: false,
                                hintText: "Password",
                                prefixIconColor: Colors.black,
                                prefixIcon: const ImageIcon(
                                    AssetImage("assets/lock.png")),
                                suffixIconColor: Colors.black,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      obsecureText.value = !obsecureText.value;
                                    },
                                    child: obsecureText.value
                                        ? const Icon(Icons.visibility_outlined)
                                        : const Icon(
                                            Icons.visibility_off_outlined)),
                              ));
                        }),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Center(
                      child: Rounded_Button(
                          title: "SIGN IN",
                          loading: authviewmodelprovider.loading,
                          onPress: () {
                            // if (_emailcontroller.text.isEmpty) {
                            //   Utilis.flushbar_message(
                            //       context, "Please enter Email");
                            // } else if (_passwordcontroller.text.isEmpty) {
                            //   Utilis.flushbar_message(
                            //       context, "Please Enter your password");
                            // } else if (_passwordcontroller.text.length < 6) {
                            //   Utilis.flushbar_message(
                            //       context, "Please Enter a 6 digit Password");
                            // } else {
                            if (kDebugMode) {
                              print(AppUrl.loginApiEndPoint);
                            }
                            {
                              Map data = {
                                "api-key":
                                    "0kks8oswoksockoo4csg0cc44k8s4gw40s04448o",
                                "username": _emailcontroller.text.toString(),
                                "password": _passwordcontroller.text.toString()
                              };

                              authviewmodelprovider.loginApi(context, data);
                            }
                          }
                          // }
                          ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                )),
          ]),
        )));
  }
}
