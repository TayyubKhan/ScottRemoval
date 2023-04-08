// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import '../data/response/api_response.dart';
// import '../repository/home_repo.dart';
//
// class HomeViewViewModel with ChangeNotifier {
//   final _myRepo = HomeRepository();
//   ApiResponse<dynamic> Order_List = ApiResponse.loading();
//   setOrderList(ApiResponse<dynamic> response) {
//     Order_List = response;
//     notifyListeners();
//   }
//
//   final _myrepo = HomeRepository();
//   Future<dynamic> fetchOrderListApi(BuildContext context) async {
//     setOrderList(ApiResponse.loading());
//     _myrepo.fetchData().then((value) {
//       setOrderList(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setOrderList(ApiResponse.error(error.toString()));
//     });
//   }
// }
//
// class scndHomeViewViewModel with ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   final _myrepo = HomeRepository();
//   Future<dynamic> scndapi() async {
//     _myrepo.fetchData().then((value) {
//       setLoading(false);
//       // final userPreference = Provider.of<WonJOB_Model>(context, listen: false);
//       dynamic auth;
//       auth = value['status'];
//       if (kDebugMode) {
//         print(auth);
//       }
//       if (auth == 200) {
//         //   userPreference.saveUser(
//         //       UserLogin_Model(loginToken: value['login_token'].toString()));
//         //   Utilis.flushbar_message(context, "Login Successfully");
//         //   Navigator.pushNamed(context, RoutesName.home);
//         // } else {
//         //   Utilis.flushbar_message(context, value['msg'].toString());
//         // }
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error);
//       }
//       setLoading(false);
//       // Utilis.flushbar_message(context, error.toString());
//     });
//   }
// }
