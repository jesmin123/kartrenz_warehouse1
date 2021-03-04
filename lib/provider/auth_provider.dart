import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/LoginModel.dart';
import 'package:kartenz/model/RespObj.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider extends ChangeNotifier{

  LoginModel _loginModel;
  LoginModel get loginModel => _loginModel;
  bool _isLoggedIn;


  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<bool> login(String locationCode, String password) async {

  Map<String,dynamic>  json = {
    "locationCode":locationCode,
    "password":password
  };
  
  String dataString = jsonEncode(json);
  RespObj respObj = await api.postData("warehouse/login",mBody: dataString);
  if(respObj.status){

    String token = respObj.token;
    saveLoginLocal(token);
    String encodedString  = token.split('.')[1]; // Decoding token to get UserSchema
    dynamic dataString  =  utf8.decode(base64Decode(base64.normalize(encodedString)));
    dataString = jsonDecode(dataString);
    _loginModel= LoginModel.fromJSON(dataString);
     _loginModel.token= token;
  }

  return respObj.status;
}

  Future<void> saveLoginLocal(String token) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('login-timestamp', DateTime.now().toString());
    sh.setString("user", token);
  }

  Future<bool> checkLoginLocal() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String loginDtTimestamp =  sh.getString('login-timestamp',);
    String token = sh.getString("user");
    if(token==null || token.isEmpty){
      return false;
    }
    String encodedString  = token.split('.')[1]; // Decoding token to get UserSchema
    dynamic dataString  =  utf8.decode(base64Decode(base64.normalize(encodedString)));
    dataString = jsonDecode(dataString);
    _loginModel= LoginModel.fromJSON(dataString);
    _loginModel.token= token;
    if(_loginModel==null){
      return false;
    }
    isLoggedIn = true;
    if(loginDtTimestamp!=null) {
      DateTime dateTimeLogin = DateTime.parse(loginDtTimestamp);
      int hrsElpased = DateTime.now().difference(dateTimeLogin).inHours;
      if (hrsElpased < 72) {
        return true;
      }
      else {
        logout();
        return false;
      }
    }
    return true;
  }

  Future<bool> logout() async {
    isLoggedIn = false;

    saveLoginLocal("");


  }
}