import 'package:scotremovals/model/Won_job_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class HomeRepository {
  Base_API_Services _apiservices = Netwrok_API_Services();

  Future<WonJOB_Model> fetch_home_api() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      dynamic response =
          await _apiservices.getPostAPI_services(AppUrl.winJobsApiEndPoint, {
        "api-key": AppUrl.API_key,
        "login_token": "b1d5781111d84f7b3fe45a0852e59758cd7a87e5"
      });
      return response = WonJOB_Model.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
