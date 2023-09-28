// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../view_model/auth_view_model.dart';

class GetImage {
  AuthViewModelProvider myrepo = AuthViewModelProvider();
  Future<dynamic> getImage(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrl.orderImagesApiEndPoint));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['order_id'] = sp.get('orderId').toString();
      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      if (jsonResponse['status'] == 200) {
        return jsonResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
