import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/BuyCodeModel.dart';
class PurchaseProvider extends ChangeNotifier{

  List<BuyCodeModel> _buyCodeList;
  List<BuyCodeModel> _auctionCodeList;

  List<BuyCodeModel> get auctionCodeList => _auctionCodeList;

  set auctionCodeList(List<BuyCodeModel> value) {
    _auctionCodeList = value;
    notifyListeners();
  }

  List<BuyCodeModel> get buyCodeList => _buyCodeList;

  set buyCodeList(List<BuyCodeModel> value) {
    _buyCodeList = value;
    notifyListeners();
  }


  Future postBuyCode(String token,String code)async{
    Map sendData={"code": code};
    List<BuyCodeModel> temp=[];
    api.postData("buy/code",header: token,mBody: jsonEncode(sendData)).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          BuyCodeModel buyCodeModel=BuyCodeModel.fromJSON(element);
          if(buyCodeModel!=null){
            temp.add(buyCodeModel);
          }
        });
      }
      buyCodeList=temp;
    });
  }


  Future postAuctionCode(String token,String code)async{
    Map sendData={"code": code};
    List<BuyCodeModel> temp=[];
    api.postData("auction/code",header: token,mBody: jsonEncode(sendData)).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          BuyCodeModel buyCodeModel=BuyCodeModel.fromJSON(element);
          if(buyCodeModel!=null){
            temp.add(buyCodeModel);
          }
        });
      }
      auctionCodeList=temp;
    });
  }
}