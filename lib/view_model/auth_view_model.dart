import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:scotremovals/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/User_Login_Model.dart';
import '../repository/auth_repo.dart';
import '../utils/Routes/routes_name.dart';
import '../utils/utilis.dart';

class AuthViewModelProvider with ChangeNotifier {
  DataViewViewModel dataview = DataViewViewModel();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myrepo = AuthRepository();
  Future<void> loginApi(BuildContext context, dynamic data) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _myrepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      dynamic auth;
      auth = value['status'];
      sp.setString('driver', value['driver_details']['id']);

      if (kDebugMode) {
        print(dataview.data);
      }
      if (auth == 200) {
        userPreference.saveUser(
            UserLogin_Model(loginToken: value['login_token'].toString()));
        Utilis.error_flushbar_message(context, "Login Successfully");
        Navigator.pushNamed(context, RoutesName.home);
      } else {
        Utilis.error_flushbar_message(context, value['msg'].toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      setLoading(false);
      Utilis.error_flushbar_message(context, error.toString());
    });
  }
}
