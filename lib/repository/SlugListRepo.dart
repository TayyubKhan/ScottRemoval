import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class SlugListRepo {
  Netwrok_API_Services _apiservices = Netwrok_API_Services();

  Future<dynamic> fetchWithPrices(String text, String item) async {
    ItemViewViewModel Item = ItemViewViewModel();
    DataViewViewModel data = DataViewViewModel();
    SharedPreferences sp = await SharedPreferences.getInstance();
    var jsonResponse;
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(AppUrl.pricesWithSlug));
      request.headers.addAll({
        'Cookie': sp.getString('cookie').toString(),
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      final slugMap = {
        'ground floor': 'ground',
        'first floor': 'first',
        'second floor': 'second',
        'third floor': 'third',
        'fourth floor': 'fourth',
        'fifth floor': 'fifth',
        'sixth floor': 'sixth',
      };
      print('object');
      final destinationFloor = item;
      final currentSlug = text.toLowerCase().split(' ')[0];
      final destinationSlug = slugMap[destinationFloor.toLowerCase()] ?? '';
      if (kDebugMode) {
        print(currentSlug);
      }
      final slugList = [
        '$currentSlug\_to\_$destinationSlug',
        '$destinationSlug\_to\_$currentSlug',
      ];
      sp.setString('slug', slugList[0]);
      request.fields['api-key'] = AppUrl.API_key;
      request.fields['login_token'] = sp.get('login_token').toString();
      request.fields['slug'] = slugList[0];
      var response = await request.send();
      jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse['data'][5]['price']);
      if (response.statusCode == 200) {
        for (int i = 0; i < jsonResponse['data'].length; i++) {
          for (int j = -5; j < Item.savedid.length; j++) {
            if (jsonResponse['data'][i]['product_id'] == Item.savedid) {
              data.getPrice(int.parse(jsonResponse['data'][i]['price']));
              print(jsonResponse['data'][i]['price']);
            }
          }
        }
        print(Item.savedid.length);
        return jsonResponse;
      } else {}
    } catch (error) {}
  }
}
