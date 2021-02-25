


import 'package:kartenz/model/TransactionModel.dart';

import 'BrokerModel.dart';
import 'CarWarehouseModel.dart';

class BuyCodeModel{
  CarWarehouseModel car;
  bool isPaid;
  String id;
  BrokerModel brokerModel;
  String code;
  Transaction transaction;

  BuyCodeModel({this.car, this.isPaid, this.id,this.brokerModel,this.code,this.transaction});

  factory BuyCodeModel.fromJSON(Map<dynamic, dynamic> json){
    try{
      return BuyCodeModel(car: CarWarehouseModel.fromJSON(json['car']),id: json['_id'],isPaid: json['isPaid'],code: json['code'],brokerModel: BrokerModel.fromJSON(json['broker']),transaction: Transaction.fromJSON(json['transaction']));
    }catch (e){
      print(e);
      return null;
    }
  }
}