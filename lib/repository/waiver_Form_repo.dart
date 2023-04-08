import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/data/network/network_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

class Waive_Form_Repository {
  Netwrok_API_Services _apiservices = Netwrok_API_Services();
  Future<void> waiverFormApi(BuildContext context, String url,
      String waiverFormDescription, String? id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var responseData;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['order_id'] = id.toString();
      print(id.toString());
      request.fields['waiver_description'] = waiverFormDescription;
      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        Utilis.submitted_flushbar_message(context, 'Submitted');
      } else {
        Utilis.error_flushbar_message(context, responseData.toString());
      }
    } catch (error) {
      Utilis.error_flushbar_message(context, responseData.toString());
    }
  }
}
