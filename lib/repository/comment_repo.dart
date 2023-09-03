// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';
import '../view_model/auth_view_model.dart';

class CommentRepo {
  AuthViewModelProvider myrepo = AuthViewModelProvider();

  Future<bool> CommentAPI(BuildContext context, String orderId, String userId,
      String driverId, String message) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrl.orderCommentApiEndPoint));
      request.headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['order_id'] = orderId;
      request.fields['driver_id'] = driverId;
      request.fields['user_id'] = userId;
      request.fields['message'] = message;

      var response = await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());

      log(jsonResponse.toString());
      log(message.toString());
      if (jsonResponse["status"] == 200) {
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
