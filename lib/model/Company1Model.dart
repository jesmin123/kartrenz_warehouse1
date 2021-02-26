import 'package:flutter/material.dart';

import 'Car1Model.dart';

class Company1{
  String id;
  String name;
  String createdon;
  Car1 car;


  Company1({this.id, this.name, this.createdon,this.car});

  factory Company1.fromJSON(Map<dynamic,dynamic> json){
    try{
      return  Company1(name:json['name'], createdon:json['createdon'],id:json['_id'],car: Car1.fromJSON(json['company']));
    }catch(e){
      print('Car Schema Exception e :'+ e.toString());
      return null;
    }
  }

}
