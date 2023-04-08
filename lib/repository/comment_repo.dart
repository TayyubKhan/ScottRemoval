import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

class CommentRepo {
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

      if (response.statusCode == 200) {
        Utilis.submitted_flushbar_message(context, "Submitted");
        return true;
      } else {
        Utilis.error_flushbar_message(context, "Oops...");
        return false;
      }
    } catch (e) {
      return false;
    }
    // prints "John Doe"// prints "johndoe@example.com"
  }
}
