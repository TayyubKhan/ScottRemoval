// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scotremovals/model/User_Login_Model.dart';
import 'package:scotremovals/repository/fetch_cookie_and_login_token.dart';

import '../../utils/Routes/routes_name.dart';
import '../user_view_model.dart';

class SplashServices {
  Fetch_cookie_and_LoginToken fk = Fetch_cookie_and_LoginToken();
  Future<UserLogin_Model> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.loginToken.toString() == 'null' ||
          value.loginToken.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        fk.fetchCookieAndLoginToken();
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
