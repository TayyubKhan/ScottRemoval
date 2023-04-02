import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scotremovals/utilis/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static get header => null;

  static Future login(String email, String pass) async {
    String? device;
    String message;
    SharedPreferences sp = await SharedPreferences.getInstance();
    device = sp.getString('device');
    final String url = Urls.authenticate;
    var jsonData;
    var params = {"login": email, "password": pass, "device_token": device};

    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: header,
            body: json.encode(params),
          )
          .timeout(const Duration(seconds: 30));

      jsonData = jsonDecode(response.body);
      message = jsonData['errors'];
      if (jsonData.containsKey('status') && jsonData['status'] == 600) {
        Helper.showAlertDialog(
          message,
          'assets/images/maintain.png',
        );
        jsonData = null;
      }

      return jsonData;
    } on TimeoutException catch (_) {
      return jsonData;
    } on SocketException catch (_) {
      return jsonData;
    }
  }
}

class Helper {
  static void showAlertDialog(String message, String s) {}
}
