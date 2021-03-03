import 'package:flutter/material.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';

class UploadedCars{
  bool deliveryPending;
  bool adminApproved;
  bool completed;
  bool isRejected;
  String id;
  String date;
  String due;
  String code;
  dynamic bids;
  bool hasExpired;
  bool hasStarted;
  CarWarehouseModel cars;
  int currentPrice;

  UploadedCars({this.deliveryPending,this.adminApproved,this.completed,this.isRejected,this.currentPrice,this.id,this.date,this.due,this.code,this.bids,this.hasExpired,this.hasStarted,this.cars});

 factory UploadedCars.fromJSON(Map<dynamic,dynamic> json){
   try{
     return UploadedCars(deliveryPending:json["deliveryPending"], adminApproved:json["adminApproved"], completed:json['completed'], isRejected:json['isRejected'], id:json["id"], date:json['json'], due:json['due'], code:json['code'], currentPrice:json['bids']!=null?json["bids"]["value"]:json["car"]["basePrice"], hasExpired:json['hasExpired'], hasStarted:json['hasStarted'], cars:CarWarehouseModel.fromJSON(json['car']));}
  catch(e){
     print(e);
     return null;
  }

 }

}