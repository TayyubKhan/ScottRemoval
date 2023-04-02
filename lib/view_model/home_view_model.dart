import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scotremovals/model/Won_job_Model.dart';

import '../data/response/api_response.dart';
import '../repository/home_repo.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<WonJOB_Model> Order_List = ApiResponse.loading();
  setOrderList(ApiResponse<WonJOB_Model> response) {
    Order_List = response;
  }

  final _myrepo = HomeRepository();
  Future<void> fetchOrderListApi(BuildContext context) async {
    setOrderList(ApiResponse.loading());
    _myrepo.fetch_home_api().then((value) {
      setOrderList(ApiResponse.completed(value));
      if (kDebugMode) {
        print("Api Hit");
      }
    }).onError((error, stackTrace) {
      setOrderList(ApiResponse.error(error.toString()));
    });
  }
}
