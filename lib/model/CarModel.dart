

import 'CompanyModel.dart';

class Car{
  String id;
  String name;
  String createdon;


  Car({this.id, this.name, this.createdon,});

  factory Car.fromJSON(Map<dynamic,dynamic> json){
    try{
      return  Car(name:json['name'], createdon:json['createdon'],id:json['_id'],);
    }catch(e){
      print('Car Schema Exception e :'+ e.toString());
      return null;
    }
  }

}