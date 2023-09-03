import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scotremovals/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExtraItemRepo {
  Future<dynamic> getExtraItemRepo(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var jsonResponse;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      var response = await request.send().timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        jsonResponse = json.decode(await response.stream.bytesToString());
      } else {}
    } catch (error) {}
    return jsonResponse;
  }
}
