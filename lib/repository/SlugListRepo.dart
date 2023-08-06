import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/app_url.dart';

class SlugListRepo {
  Future<dynamic> fetchWithPrices(
      String text, String item, BuildContext context, int id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var jsonResponse;
    final slugMap = {
      'ground floor': 'ground',
      'first floor': 'first',
      'second floor': 'second',
      'third floor': 'third',
      'fourth floor': 'fourth',
      'fifth floor': 'fifth',
      'sixth floor': 'sixth',
    };
    final destinationFloor = item;

    final currentSlug = text.toLowerCase().split(' ')[0];
    final destinationSlug = slugMap[destinationFloor.toLowerCase()] ?? '';
    final slugList = [
      '$currentSlug\_to\_$destinationSlug',
      '$destinationSlug\_to\_$currentSlug',
    ];
    print(slugList[0]);
    sp.setString('slug', slugList[0]);
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrl.productPriceApiEndPoint));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });

      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['slug'] = slugList[0];
      request.fields['product_id'] = id.toString();
      var response = await request.send();
      jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse);
      return jsonResponse['price']['price'];
      // } else {}
    } catch (error) {}
  }
}
