import 'package:kartenz/model/BrokerModel.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';
import 'package:kartenz/model/LoginModel.dart';

class Transaction{
  String date,amount;
  String type,code,ltransactionID;
  bool completed;
  int tAmount;
  BrokerModel broker;
  CarWarehouseModel carWarehouseModel;
  LoginModel loginModel;

  Transaction({this.tAmount,this.date,  this.type, this.code,
    this.ltransactionID,this.amount,this.completed,this.broker,this.carWarehouseModel,this.loginModel});



  factory Transaction.fromJSON(Map<dynamic,dynamic> json){
    return Transaction(amount: json['amount'].toString(),completed: json['completed'],code: json['code'],ltransactionID: json['_id'],
        type: json['type'],broker: BrokerModel.fromJSON(json['broker']),
        carWarehouseModel: CarWarehouseModel.fromJSON(json['car']),loginModel: LoginModel.fromJSON(json['createdBy']),date: json['createdon']);
  }

}