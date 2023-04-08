import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/data/network/network_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

Netwrok_API_Services _apiservices = Netwrok_API_Services();

class SignatureRepo {
  Future<bool> signatureAPI(
      BuildContext context, String orderID, Uint8List pngBytes) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse(AppUrl.orderSignatureApiEndPoint);
      final request = http.MultipartRequest('POST', url);

      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });

      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['order_id'] = orderID;

      request.files.add(await http.MultipartFile.fromBytes(
        'img',
        pngBytes,
        filename: 'signature.png',
      ));
      final response =
          await request.send().timeout(const Duration(seconds: 10));
      dynamic jsonResponse = json.decode(await response.stream.bytesToString());
      if (jsonResponse['status' == 200]) {
        Utilis.submitted_flushbar_message(context, 'Submitted');
        return true;
      } else {
        Utilis.error_flushbar_message(context, 'Try again');
        return false;
      }
    } catch (e) {
      Utilis.error_flushbar_message(context, e.toString());
      return false;
    }
  }
}
