

import 'CarWarehouseModel.dart';
import 'TransactionModel.dart';

class BuyModel{
  CarWarehouseModel car;
  bool isPaid;
  String id;
  Transaction transaction;
  String code = "Nil";

  BuyModel({this.car, this.isPaid, this.id,this.transaction,this.code});

  factory BuyModel.fromJSON(Map<dynamic, dynamic> json){
    try{
      return BuyModel(car: CarWarehouseModel.fromJSON(json['car']),id: json['_id'],isPaid: json['isPaid'],code: json['code']);
    }catch (e){
      print(e);
      return null;
    }
  }
}