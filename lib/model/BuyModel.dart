

import 'package:kartenz/model/BrokerModel.dart';

import 'CarWarehouseModel.dart';


class BuyModel{
  CarWarehouseModel car;
  bool isPaid;
  String id;
  BrokerModel brokerModel;
  String code;

  BuyModel({this.car, this.isPaid, this.id,this.brokerModel,this.code});

  factory BuyModel.fromJSON(Map<dynamic, dynamic> json){
    try{
      return BuyModel(car: CarWarehouseModel.fromJSON(json['car']),id: json['_id'],isPaid: json['isPaid'],code: json['code'],brokerModel: BrokerModel.fromJSON(json['broker']));
    }catch (e){
      print(e);
      return null;
    }
  }
}