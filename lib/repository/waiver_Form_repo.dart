// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class Waive_Form_Repository {
  AuthViewModelProvider myrepo = AuthViewModelProvider();
  Future<dynamic> waiverFormApi(BuildContext context, String url,
      String waiverFormDescription, String? id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
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
      log(waiverFormDescription);
      request.fields['waiver_description'] = waiverFormDescription.toString();
      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      log(jsonResponse.toString());
      if (jsonResponse['status'] == 200) {
        Utilis.Snackbar_Message(context, 'Submitted');
        myrepo.setLoading(false);
        return true;
      } else {
        Utilis.Snackbar_ErrorMessage(context, 'Try again');
        myrepo.setLoading(false);
        return false;
      }
    } catch (e) {
      myrepo.setLoading(false);
      return false;
    }
  }
}
