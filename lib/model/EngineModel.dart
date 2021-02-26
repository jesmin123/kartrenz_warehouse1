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
  double rating;

  EngineModel({this.engine, this.engineSound, this.engineVideo,
    this.exhaustSmoke, this.engineMounting, this.clutch, this.gearShifting,
    this.engineOil, this.engineOilLevelDipstick, this.battery, this.coolant, this.rating});

  factory EngineModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return EngineModel(coolant: json['coolant']!=null?json['coolant']:"No Data",battery: json['battery']!=null?json['battery']:"No Data",
          engineOilLevelDipstick: json['engineOilLevelDipstick']!=null?json['engineOilLevelDipstick']:"No Data", engineOil: json['engineOil']!=null?json['engineOil']:"No Data",
          gearShifting: json['gearShifting']!=null?json['gearShifting']:"No Data",clutch: json['clutch']!=null?json['clutch']:"No Data",
          engineMounting: json['engineMounting']!=null?json['engineMounting']:"No Data", exhaustSmoke: json['exhaustSmoke']!=null?json['exhaustSmoke']:"No Data",
          engineVideo: json['engineVideo']!=null?json['engineVideo']:"No Data",engine: json['engine']!=null?json['engine']:"No Data",
          engineSound: json['engineSound']!=null?json['engineSound']:"No Data",
          rating: json["rating"]!=null?json["rating"]:"No Data"
      );
    }catch(e){
      print("Exception : e"+e.toString());
      return null;
    }
  }

}