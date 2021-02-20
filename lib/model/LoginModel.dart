import 'package:flutter/material.dart';

class LoginModel{
String role;
String id;
String locationCode;
String address;
String contactNumber;
String password;
String name;
String createdOn;

LoginModel(this.role,this.id,this.locationCode,this.address,this.contactNumber,this.password,this.name,this.createdOn);

factory LoginModel.fromJSON(Map<String,dynamic> json){
  try{
    json = json['snapshot'];
    return LoginModel(json['role'], json['_id'],json['locationCode'],json['address'],json['contactNumber'],json['password'],json['name'],json['createdon']);
  }catch(e){
    print(e);
    return null;
  }
}
}