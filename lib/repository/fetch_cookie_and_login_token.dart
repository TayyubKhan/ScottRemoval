import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';

class Fetch_cookie_and_LoginToken {
  void fetchCookieAndLoginToken() async {
    try {
      String? loginToken;
      SharedPreferences sp = await SharedPreferences.getInstance();
      print(sp.get('email').toString());
      final response = await http.post(
        Uri.parse(AppUrl.loginApiEndPoint),
        body: {
          "api-key": AppUrl.API_key,
          "username": sp.get('email').toString(),
          "password": sp.get('password').toString()
        },
      ).then((value) {
        loginToken = value.body.split(',')[2];
        loginToken = loginToken.toString().split(':')[1];
        loginToken = loginToken.toString().split('"')[1];
        sp.setString('login_token', loginToken.toString());
        List<String?> cookie =
            value.headers['set-cookie'].toString().split(';');
        sp.setString('cookie', cookie[0].toString());
      }).timeout(const Duration(seconds: 1000));
    } catch (e) {}
  }
}
