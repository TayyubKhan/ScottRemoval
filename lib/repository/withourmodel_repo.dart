import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scotremovals/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WithoutModelRepo {
  Future<dynamic> fetchOrderDetails() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var jsonResponse;
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(AppUrl.orderDetailsEndPoint));
      request.headers.addAll({
        'Cookie': 'sess=e1fee5bae8d78d6b444ca30b1e20e1ec382edfb7',
        'Cache-Control': 'no-cache',
        'Postman-Token': '<calculated when request is sent>',
      });
      request.fields['api-key'] = '0kks8oswoksockoo4csg0cc44k8s4gw40s04448o';
      request.fields['login_token'] =
          '902ba3cda1883801594b6e1b452790cc53948fda';
      request.fields['order_id'] = '371';

      var response = await request.send();
      if (response.statusCode == 200) {
        jsonResponse = json.decode(await response.stream.bytesToString());
      } else {}
    } catch (error) {}
    return jsonResponse; // prints "John Doe"// prints "johndoe@example.com"
  }
}
