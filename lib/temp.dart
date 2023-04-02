import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scotremovals/res/Components/Rounded_Button.dart';

class API_Testing extends StatefulWidget {
  const API_Testing({Key? key}) : super(key: key);

  @override
  State<API_Testing> createState() => _API_TestingState();
}

class _API_TestingState extends State<API_Testing> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Rounded_Button(
          title: 'Button',
          onPress: () {
            postData();
          },
        ),
      ),
    );
  }
}

Future<void> postData() async {
  final String apiUrl = 'https://scot.adroitsol.co/api/v1/Order/won_jobs';
  final String apiKey = '0kks8oswoksockoo4csg0cc44k8s4gw40s04448o0';
  final String loginToken = 'ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4';

  // create the request body as a Map object
  final Map<String, dynamic> requestBody = {
    'api_key': apiKey,
    'login_token': loginToken,
    // add any additional data here as needed
  };

  // encode the request body as JSON
  final String jsonBody = jsonEncode(requestBody);

  try {
    // make the API request
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    // handle the response
    if (response.statusCode == 200) {
      // request succeeded, parse the response JSON
      final dynamic responseData = jsonDecode(response.body);
      // do something with the response data
    } else {
      // request failed
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // handle any errors that occurred during the request
    print('Error occurred: $e');
  }
}
