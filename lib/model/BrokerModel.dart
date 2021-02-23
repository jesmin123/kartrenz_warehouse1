import 'package:flutter/material.dart';

class BrokerModel{
String state;
String country;
String role;
bool isVerified;
String status;
String msg;
int noofcarswon;
String id;
String name;
String password;
String phone;
String address0;
String city;
String district;
String panno;
String createdon;
dynamic pancard;
dynamic aadharFront;
dynamic aadharBack;

BrokerModel({
      this.state,
      this.country,
      this.role,
      this.isVerified,
      this.status,
      this.msg,
      this.noofcarswon,
      this.id,
      this.name,
      this.password,
      this.phone,
      this.address0,
      this.city,
      this.district,
      this.panno,
      this.createdon,
      this.pancard,
      this.aadharFront,
      this.aadharBack});

factory BrokerModel.fromJSON(Map<dynamic,dynamic> json){
  try{
    return BrokerModel(state:json['state'], country:json['country'], role:json['role'], isVerified:json['isverified'], status:json['status'], msg:json['msg'], noofcarswon:json['noofcarswon'], id:json['_id'], name:json['name'], password:json['password'], phone:json['phone'], address0:json['address0'], city:json['city'], district:json['district'], panno:json['panno'], createdon:json['createdon'], pancard:json['pancard'], aadharFront:json['aadharFront'], aadharBack:json['aadharBack']);
  }catch(e){
    print(e);
    return null;
  }
}
}
