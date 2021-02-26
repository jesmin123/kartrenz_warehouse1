import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class MyProfileTab extends StatefulWidget {
  @override
  _MyProfileTabState createState() => _MyProfileTabState();
}

class _MyProfileTabState extends State<MyProfileTab> {
  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    AuthProvider authProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12,),
              rowList("Name :", authProvider.loginModel.name),
              SizedBox(height: 12,),
              rowList("Location Code :", authProvider.loginModel.locationCode),
              SizedBox(height: 12,),
              rowList("Address :", authProvider.loginModel.address),
              SizedBox(height: 12,),
              rowList("Contact :", authProvider.loginModel.contactNumber),


            ],
          ),
        ),
      ),
    );
  }
}

Widget rowList(String value1, String value2){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(value1, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR, textSize: 18.0),),
      Text(value2, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR, textSize: 18.0),),
    ],
  );
}