// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';
import 'fetch_cookie_and_login_token.dart';

class PickupRepo {
  AuthViewModelProvider myrepo = AuthViewModelProvider();
  Fetch_cookie_and_LoginToken fk = Fetch_cookie_and_LoginToken();
  Future<bool> PickupApi(
      BuildContext context, String pickupStatus, String orderId) async {
    fk.fetchCookieAndLoginToken();
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://scotremovals.com/api/v1/order/update_pickup_status'));
      request.headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['pickup_status'] = pickupStatus;
      request.fields['order_id'] = orderId;
      if (kDebugMode) {
        print(sp.get('login_token').toString());
      }
      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      if (jsonResponse["status"] == true) {
        Utilis.Snackbar_Message(context, "Success");
        myrepo.setLoading(false);
        return true;
      } else {
        Utilis.Snackbar_ErrorMessage(context, "Oops...");
        myrepo.setLoading(false);
        return false;
      }
    } catch (e) {
      Utilis.Snackbar_ErrorMessage(context, e.toString());
      myrepo.setLoading(false);
      return false;
    }
    // prints "John Doe"// prints "johndoe@example.com"
  }
}
