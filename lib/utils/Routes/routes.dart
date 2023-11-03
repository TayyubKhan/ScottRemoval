import 'package:flutter/material.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view/ItemsandFloorsView.dart';
import 'package:scotremovals/view/add_Items_view.dart';
import 'package:scotremovals/view/add_floor_view.dart';
import 'package:scotremovals/view/add_photo_view.dart';
import 'package:scotremovals/view/comment_View.dart';
import 'package:scotremovals/view/extra_itemView.dart';
import 'package:scotremovals/view/signature_view.dart';
import 'package:scotremovals/view/waiverForm_View.dart';

import '../../view/Home_Screen.dart';
import '../../view/Login_screenView.dart';
import '../../view/order_detail_view.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> Generate_Routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home_screen_View());
      case RoutesName.singleOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Order_Detail());
      case RoutesName.addItemsAndFloors:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ItemsAndFloorView());
      case RoutesName.waiverForm:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Waiver_Form_View());
      case RoutesName.addItems:
        return MaterialPageRoute(
            builder: (BuildContext context) => Add_Items_View());
      case RoutesName.photo:
        return MaterialPageRoute(
            builder: (BuildContext context) => Add_Photo_View());
      case RoutesName.comment:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CommentView());
      case RoutesName.signature:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Signature_View());
      case RoutesName.addFloors:
        return MaterialPageRoute(
            builder: (BuildContext context) => Add_Floor_View());
      case RoutesName.extraitem:
        return MaterialPageRoute(
            builder: (BuildContext context) => Extra_Items_View());
      case RoutesName.singleOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => Extra_Items_View());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('You are on the Wrong way'),
            ),
          );
        });
    }
  }
}
