import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/CarModel.dart';

import 'RespObj.dart';

class Company{
  String id;
  String name;
  String createdon;
  List<Car> cars;

  Company({this.id,this.name, this.createdon,this.cars});


  factory Company.fromJSON(Map<dynamic, dynamic> json){
    try{
      List<dynamic> data=json['cars'];
      List<Car> carsTemp=[];
      data.forEach((element) {
        Car car=Car.fromJSON(element);
        carsTemp.add(car);
      });
      return Company(id:json['_id'],name: json['name'],createdon: json['createdon'],cars: carsTemp);
    }catch(e){
      print("Company Exception e: "+e.toString());
      return null;
    }
  }


}