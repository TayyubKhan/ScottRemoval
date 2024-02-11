import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/ExtraItemFloorViewModel.dart';
import 'package:scotremovals/view_model/FloorViewVIewModel.dart';
import 'package:scotremovals/view_model/GoogleMapViewModel.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:scotremovals/view_model/photoviewviewmodel.dart';
import 'package:scotremovals/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModelProvider()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => DataViewViewModel()),
          ChangeNotifierProvider(create: (_) => ItemViewViewModel()),
          ChangeNotifierProvider(create: (_) => FloorModel()),
          ChangeNotifierProvider(create: (_) => ExtraItemViewViewModel()),
          ChangeNotifierProvider(create: (_) => PhotoViewViewModel()),
          ChangeNotifierProvider(create: (_) => GoogleMapViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: TemporaryScreen()
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.Generate_Routes,
        ));
  }
}
