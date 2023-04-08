import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class Fetch_cookie_and_LoginToken {
  Netwrok_API_Services _apiservices = Netwrok_API_Services();
  void fetchCookieAndLoginToken() async {
    String? loginToken;
    SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(AppUrl.loginApiEndPoint),
      body: {
        "api-key": AppUrl.API_key,
        "username": "ebad.connect@gmail.com",
        "password": "123456"
      },
    ).then((value) {
      loginToken = value.body.split(',')[2];
      loginToken = loginToken.toString().split(':')[1];
      loginToken = loginToken.toString().split('"')[1];
      sp.setString('login_token', loginToken.toString());
      List<String?> cookie = value.headers['set-cookie'].toString().split(';');
      sp.setString('cookie', cookie[0].toString());
    }).timeout(const Duration(seconds: 1000));
  }
}
