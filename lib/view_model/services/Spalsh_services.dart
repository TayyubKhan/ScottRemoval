import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scotremovals/model/User_Login_Model.dart';

import '../../utils/Routes/routes_name.dart';
import '../user_view_model.dart';

class SplashServices {
  Future<UserLogin_Model> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (kDebugMode) {
        print(value.loginToken.toString());
      }
      if (value.loginToken.toString() == 'null' ||
          value.loginToken.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(milliseconds: 1));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
