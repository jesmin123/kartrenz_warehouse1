import 'package:flutter/material.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/electrical_form_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/pages/add_transaction_page.dart';
import 'package:kartenz/ui/pages/cars_page.dart';
import 'package:kartenz/ui/pages/home_page.dart';
import 'package:kartenz/ui/pages/login_page.dart';
import 'package:kartenz/ui/pages/sold_cars_page.dart';
import 'package:kartenz/ui/pages/splash_screen_page.dart';
import 'package:kartenz/ui/pages/transaction_page.dart';
import 'package:kartenz/ui/widgets/Accepted_Form_Widget/accepted_detail_widget.dart';
import 'package:kartenz/ui/widgets/Accepted_Form_Widget/expanded_accepted_widget.dart';
import 'package:kartenz/ui/widgets/Submitted_Form_widget/expand_details-page.dart';
import 'package:kartenz/ui/widgets/Submitted_Form_widget/submitted_detail_page.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'constants/strings.dart';
import 'ui/widgets/Upload_Form_Widgets/basic_details_form_widget.dart';

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
    BASIC_DETAILS_FORM : (context) => BasicDetailsForm(),
    SUBMITTED_DETAILS_PAGE : (context) => SubmittedDetailPage(),
    EXPAND_DETAILS_PAGE : (context) => ExpandDetailPage(),
    ACCEPTED_DETAIL_WIDGET : (context) => AcceptedDetailWidget(),
    EXPANDED_ACCEPTED_WIDGET : (context) => ExpandedAcceptedWidget(),
    TRANSACTION_PAGE : (context) => TransactionPage(),
    SOLD_CAR_PAGE : (context) => SoldCarPage(),
    ADD_TRANSACTION_PAGE : (context) => AddTransactionPage()
  };

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<FormData>(create: (_)=>FormData()),
        ChangeNotifierProvider<BasicProvider>(create: (_)=>BasicProvider()),
        ChangeNotifierProvider<ElectricalFormProvider>(create: (_)=>ElectricalFormProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_)=>AuthProvider()),
        ChangeNotifierProvider<AuctionProvider>(create: (_)=>AuctionProvider()),

      ],
      child: Consumer<FormData>(
        builder: (context,basicProvider,child)=> MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            backgroundColor: APP_WHITE_COLOR,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: routes,
          initialRoute: SPLASH_SCREEN_PAGE,
        ),
      ),
    );
  }
}
