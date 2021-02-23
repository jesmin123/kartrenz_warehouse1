import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/LoginModel.dart';
import 'package:kartenz/model/RespObj.dart';
import 'package:kartenz/model/uploadedCars.dart';
import 'package:kartenz/provider/auth_provider.dart';

class AuctionProvider extends ChangeNotifier{

List<UploadedCars> _auction;

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
}