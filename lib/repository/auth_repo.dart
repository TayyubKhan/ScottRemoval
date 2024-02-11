import '../data/network/base_apiservices.dart';
import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class AuthRepository {
  Base_API_Services _apiservices = Netwrok_API_Services();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservices.getPostAPI_services(AppUrl.loginApiEndPoint, data);
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
