import 'package:flutter/material.dart';
import 'package:kartenz/model/BidModel.dart';
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
  bool hasExpired;
  bool hasStarted;
  List<BidModel> bids = [];
  CarWarehouseModel cars;
  int currentPrice;

  UploadedCars({this.deliveryPending,this.adminApproved,this.completed,this.isRejected,this.currentPrice,this.id,this.date,this.due,this.code,this.bids,this.hasExpired,this.hasStarted,this.cars});

 factory UploadedCars.fromJSON(Map<dynamic,dynamic> json){
   try{
     List<BidModel> bidsTemp = [];
     if(json.containsKey("bids")){
       List<dynamic> bidsJson = json['bids'];
       bidsJson.forEach((element) {
         BidModel bidModel = BidModel.fromJSON(json['bids']);
         if(bidModel!=null){
           bidsTemp.add(bidModel);
         }
       });
     }
     return UploadedCars(deliveryPending:json["deliveryPending"], adminApproved:json["adminApproved"], completed:json['completed'], isRejected:json['isRejected'], id:json["id"], date:json['json'], due:json['due'], code:json['code'], currentPrice:json['bids']!=null?json["bids"]["value"]:json["car"]["basePrice"], hasExpired:json['hasExpired'], hasStarted:json['hasStarted'],bids: bidsTemp, cars:CarWarehouseModel.fromJSON(json['car']));}
  catch(e){
     print(e);
     return null;
  }

 }

 String getCurrentPrice(){
   if(bids!=null){
     if(bids.length>0){
       BidModel bidModel = bids.last;
       return bidModel.value.toString();
     }else{
       return cars.basePrice.toString();
     }

   }else{
     return cars.basePrice.toString();
   }
 }

 String getBroker(){
   if(bids!=null){
     if(bids.length>0){
       BidModel bidModel = bids.last;
       return bidModel.broker.name;
     }else{
       return 'Nil';
     }
   }else{
     return "Nil";
   }
 }

}