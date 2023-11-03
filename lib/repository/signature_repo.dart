import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

AuthViewModelProvider myrepo = AuthViewModelProvider();

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
      log("Signture status:" + jsonResponse.toString());
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
