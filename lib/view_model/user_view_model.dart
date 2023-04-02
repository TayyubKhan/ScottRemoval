import 'package:flutter/foundation.dart';
import 'package:scotremovals/model/User_Login_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserLogin_Model user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.loginToken.toString());
    if (kDebugMode) {
      print(user.loginToken);
    }
    notifyListeners();
    return true;
  }

  Future<UserLogin_Model> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserLogin_Model(loginToken: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
