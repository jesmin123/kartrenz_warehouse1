import 'package:flutter/material.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/pages/cars_page.dart';
import 'package:kartenz/ui/pages/home_page.dart';
import 'package:kartenz/ui/pages/login_page.dart';
import 'package:kartenz/ui/pages/splash_screen_page.dart';
import 'package:kartenz/ui/widgets/basic_details_form_widget.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'constants/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String, WidgetBuilder>{
    SPLASH_SCREEN_PAGE : (context)=> SplashScreenPage(),
    LOGIN_PAGE : (context)=> LoginPage(),
    HOME_PAGE : (context)=> HomePage(),
    CARS_PAGE : (context) => CarsPage(),
    BASIC_DETAILS_FORM : (context) => BasicDetailsForm()
  };

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<FormData>(create: (_)=>FormData()),
        ChangeNotifierProvider<BasicProvider>(create: (_)=>BasicProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: APP_WHITE_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
        initialRoute: SPLASH_SCREEN_PAGE,
      ),
    );
  }
}
