import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/BuyCodeModel.dart';
import 'package:kartenz/model/RespObj.dart';
class PurchaseProvider extends ChangeNotifier{


  BuyCodeModel _transaction;


  BuyCodeModel get transaction => _transaction;

  set transaction(BuyCodeModel value) {
    _transaction = value;
    notifyListeners();
  }

  Future<bool> getTrnsactionDetail(String token,String code,int type)async{
    Map sendData={"code": code};
    List<BuyCodeModel> temp=[];
    String route = type==1?"buy/code":"auction/code";
    RespObj respObj = await api.postData(route,header: token,mBody: jsonEncode(sendData));
    if(respObj.status){
      List<dynamic> data=respObj.data;
      if(data!=null && data.length>0){
        BuyCodeModel buyCodeModel=BuyCodeModel.fromJSON(data.first);
        if(buyCodeModel==null){return false;}
        transaction = buyCodeModel;
        return true;
      }
      else{
        return false;
      }
    }
    return respObj.status;
  }

  bool _isResultReady = false;

  bool get isResultReady => _isResultReady;

  set isResultReady(bool value) {
    _isResultReady = value;
    notifyListeners();
  }
}