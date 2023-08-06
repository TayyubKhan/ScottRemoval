import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/temp.dart';
import 'package:scotremovals/utils/Routes/routes.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view/signature_view.dart';
import 'package:scotremovals/view_model/AdditemsViewVIewModel.dart';
import 'package:scotremovals/view_model/ExtraItemFloorViewModel.dart';
import 'package:scotremovals/view_model/FloorViewVIewModel.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:scotremovals/view_model/dataViewModel.dart';
import 'package:scotremovals/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          ChangeNotifierProvider(create: (_) => SignatureProvider()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: MapScreen()
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.Generate_Routes,
            ));
  }
}
