import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';
import '../utils/utilis.dart';

class OrderImages {
  Future<bool> sendOrderImages(
      BuildContext context, List<File> imageFiles, String? orderId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      // Create a multipart request
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrl.saveOrderImagesApiEndPoint),
      );
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      // Add the image files to the request
      for (var i = 0; i < imageFiles.length; i++) {
        final imageFile = imageFiles[i];
        final stream = http.ByteStream(imageFile.openRead());
        final length = await imageFile.length();
        final img = http.MultipartFile(
          'img[$i]',
          stream,
          length,
          filename: imageFile.path.split('/').last,
        );
        request.fields['api-key'] = AppUrl.API_key;
        request.fields['login_token'] = sp.get('login_token').toString();
        request.fields['order_id'] = orderId.toString();
        request.files.add(img);
      }

      // Send the request
      final response =
          await request.send().timeout(const Duration(seconds: 10));
      final responseData = await response.stream.bytesToString();
      dynamic jsonResponse = json.decode(responseData);
      if (jsonResponse['status'] == 200) {
        // ignore: use_build_context_synchronously
        Utilis.Snackbar_Message(context, 'Submitted Successfully');
        return true;
      } else {
        // ignore: use_build_context_synchronously
        Utilis.Snackbar_ErrorMessage(context, 'Try again');
        return false;
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utilis.Snackbar_ErrorMessage(context, e.toString());
      return false;
    }
  }
}
