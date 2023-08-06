// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

AuthViewModelProvider myrepo = AuthViewModelProvider();

class UpdateItemRepo {
  Future<bool> UpdateItemAPI(
      BuildContext context, String? id, dynamic data) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var responseData;
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrl.updateOrderApiEndPoint));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['order_id'] = id.toString();
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['slug'] = sp.get('slug').toString();
      String jsonString = jsonEncode(data);
      request.fields['order_items'] = jsonString;
      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      if (jsonResponse.statusCode == 200) {
        Utilis.submitted_flushbar_message(context, 'Success');
        myrepo.setLoading(false);
        return true;
      } else {
        myrepo.setLoading(false);
        return true;
      }
    } catch (error) {
      myrepo.setLoading(false);
      return false;
    }
  }
}
