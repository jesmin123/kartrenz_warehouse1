import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/utilis/AlertBox.dart';
import 'package:kartenz/ui/utilis/loader_utilis.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userName = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider=Provider.of(context);
    AuctionProvider auctionProvider=Provider.of(context);
    FormData formData=Provider.of(context);
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
                focusNode: f2,
                controller: _userName,
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
                focusNode: f1,
                controller: _password,
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
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    f1.unfocus();
                    f2.unfocus();
                    Loader.getLoader(context).show();
                    bool status = await authProvider.login(_userName.text, _password.text);

                    Loader.getLoader(context).hide();
                    if(status){
                      formData.getCompany();
                      auctionProvider.getAuctionsBuyAll(authProvider.loginModel.token);
                      Navigator.pushNamed(context, HOME_PAGE);
                    }
                    else{
                      AlertBox.showToast("Invalid Username or password");
                    }
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
