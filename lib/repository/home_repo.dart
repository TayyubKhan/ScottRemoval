// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/model/WonJobModel.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';

class HomeRepository {
  Future<WonJobModel> fetchData(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var jsonResponse;
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(AppUrl.winJobsApiEndPoint));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      var response = await request.send();
      jsonResponse = json.decode(await response.stream.bytesToString());
      print('Calling');
      if (response.statusCode == 200) {
        return WonJobModel.fromJson(jsonResponse);
      } else {
        return Utilis.error_flushbar_message(context, 'Oops');
      }
    } catch (e) {
      return Utilis.error_flushbar_message(context, e.toString());
    }

    // prints "John Doe"// prints "johndoe@example.com"
  }
}
