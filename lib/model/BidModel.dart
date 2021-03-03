


import 'package:kartenz/model/BrokerModel.dart';

class BidModel{
  bool isConfirmed;
  String time;
  int value;
  BrokerModel broker;

  BidModel({this.isConfirmed, this.time, this.value, this.broker});

  factory BidModel.fromJSON(Map<String,dynamic> json){
    try{
      return BidModel(isConfirmed: json['confirmed'],broker: BrokerModel.fromJSON(json['participant']),value: json['value'],time: json['time']);
    }catch(ex){
      print(ex.toString());
      return null;
    }
  }
}