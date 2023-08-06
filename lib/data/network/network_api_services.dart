import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_apiservices.dart';

class Netwrok_API_Services extends Base_API_Services {
  @override
  Future getGetAPI_services(String url) async {
    dynamic responseJSon;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      responseJSon = return_response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connectivity');
    }
    return responseJSon;
  }

  @override
  Future getPostAPI_services(String url, dynamic data) async {
    dynamic responseJSon;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJSon = return_response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connectivity');
    }
    if (kDebugMode) {
      print(responseJSon);
    }
    return responseJSon;
  }

  dynamic return_response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with servers');
    }
  }

  dynamic return_responseforformdata(dynamic response) async {
    switch (response.statuscode) {
      case 200:
        dynamic jsonResponse =
            json.decode(await response.stream.bytesToString());
        return jsonResponse;
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with servers');
    }
  }
}
