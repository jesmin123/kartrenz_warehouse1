

import 'CompanyModel.dart';

class Car{
  String id;
  Company company;
  String name;
  String createdon;

  Car({this.id,this.company, this.name, this.createdon});

  factory Car.fromJSON(Map<dynamic,dynamic> json){
    try{
      return  Car(company:Company.fromJSON(json['company']), name:json['name'], createdon:json['createdon'],id:json['_id']);
    }catch(e){
      print('Car Schema Exception e :'+ e.toString());
      return null;
    }
  }

  String getCarName(){
    return company.name+" "+name;
  }
}