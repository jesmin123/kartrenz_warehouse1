import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/LoginModel.dart';
import 'package:kartenz/model/RespObj.dart';
import 'package:kartenz/model/TransactionModel.dart';
import 'package:kartenz/model/uploadedCars.dart';
import 'package:kartenz/provider/auth_provider.dart';

class AuctionProvider extends ChangeNotifier{

List<UploadedCars> _auction;
List<Transaction> _transactions;

List<Transaction> get transactions => _transactions;

  set transactions(List<Transaction> value) {
    _transactions = value;
    notifyListeners();
  }

  List<UploadedCars> get auction => _auction;

  set auction(List<UploadedCars> value) {
    _auction = value;
    notifyListeners();
  }

  Future getAuctionsBuyAll(String token) async{
    List<UploadedCars> temp = [];
    api.getData("auction/all",header:  token).then((respObj) {
      if(respObj.status){
        List<dynamic> datas = respObj.data;
        datas.forEach((element) {
          UploadedCars uploadedCars=UploadedCars.fromJSON(element);
          if(uploadedCars!=null){
          temp.add(uploadedCars);
          }
        });

      }
      auction=temp;
    });

  }
  Future getTransaction(String id,String token)async{
    Map sendData = {"createdBy":id};
    List<Transaction> temp=[];
    api.postData("transaction/createdBy",header: token,mBody: jsonEncode(sendData)).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          Transaction transaction=Transaction.fromJSON(element);
          if(transaction!=null){
            temp.add(transaction);
          }
        });
      }
      transactions=temp;
    } );
  }

}