import 'package:flutter/material.dart';

class Car1{
  String id;
  String name;
  String createdon;


  Car1({this.id, this.name, this.createdon,});

  factory Car1.fromJSON(Map<dynamic,dynamic> json){
    try{
      return  Car1(name:json['name'], createdon:json['createdon'],id:json['_id'],);
    }catch(e){
      print('Car Schema Exception e :'+ e.toString());
      return null;
    }
  }

}


