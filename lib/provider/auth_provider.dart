import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/LoginModel.dart';
import 'package:kartenz/model/RespObj.dart';
class AuthProvider extends ChangeNotifier{

  LoginModel _loginModel;


  LoginModel get loginModel => _loginModel;



  Future<bool> login(String locationCode, String password) async {

  Map<String,dynamic>  json = {
    "locationCode":locationCode,
    "password":password
  };
  
  String dataString = jsonEncode(json);
  RespObj respObj = await api.postData("warehouse/login",mBody: dataString);
  if(respObj.status){
    String token = respObj.token;
    String encodedString  = token.split('.')[1]; // Decoding token to get UserSchema
    dynamic dataString  =  utf8.decode(base64Decode(base64.normalize(encodedString)));
    dataString = jsonDecode(dataString);
    _loginModel= LoginModel.fromJSON(dataString);
     _loginModel.token= token;
  }

  return respObj.status;
}
}