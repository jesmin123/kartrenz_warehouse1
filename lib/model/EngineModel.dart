import 'package:flutter/material.dart';

class EngineModel{
  String engine="";
  String engineSound=" ";
  String engineVideo=" ";
  String exhaustSmoke=" ";
  String engineMounting=" ";
  String clutch=" ";
  String gearShifting=" ";
  String engineOil=" ";
  String engineOilLevelDipstick=" ";
  String battery=" ";
  String coolant=" ";

  EngineModel({this.engine, this.engineSound, this.engineVideo,
    this.exhaustSmoke, this.engineMounting, this.clutch, this.gearShifting,
    this.engineOil, this.engineOilLevelDipstick, this.battery, this.coolant});

  factory EngineModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return EngineModel(coolant: json['coolant'],battery: json['battery '],engineOilLevelDipstick: json['engineOilLevelDipstick'],
          engineOil: json['engineOil '],gearShifting: json['gearShifting'],clutch: json['clutch'],engineMounting: json['engineMounting'],
          exhaustSmoke: json['exhaustSmoke'],engineVideo: json['engineVideo'],engine: json['engine'],engineSound: json['engineSound']
      );
    }catch(e){
      print("Exception : e"+e.toString());
      return null;
    }
  }

}