import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/image 1.png",height: 180, ),
              SizedBox(
                height: 12,
              ),
              Text("Warehouse", style: AppFontStyle.ultraTextStyle(APP_DARK_WHITE),),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter the Username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: AppFontStyle.bodyTextStyle(PRIMARY_COLOR),
                  labelText: "Username",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: PRIMARY_COLOR)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: PRIMARY_COLOR)
                  ),

                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter the password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: AppFontStyle.bodyTextStyle(PRIMARY_COLOR),
                  labelText: "Password",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: PRIMARY_COLOR)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: PRIMARY_COLOR)
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(context, HOME_PAGE);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                color: PRIMARY_COLOR,
                child: Text(
                  "Login",
                  style: AppFontStyle.regularTextStyle2(APP_WHITE_COLOR),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
