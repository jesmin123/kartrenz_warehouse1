import 'package:flutter/material.dart';

class ElectricModel{
  String airbagFeature;
  String musicSystem;
  String leatherSeat;
  String  fabricSeat;
  String sunroof;
  String steelMountedAudioControl;
  String ABS;
  String rearDefogger;
  String  reverseCamera;
  String  electrical;
  String interior;
  String powerWindowLHSFront;
  String powerWindowRHSFront;
  String powerWindowLHSRear;
  String powerWindowRHSRear;
  dynamic custom;
  int rating;

  ElectricModel({this.airbagFeature, this.musicSystem, this.leatherSeat,
    this.fabricSeat, this.sunroof, this.steelMountedAudioControl, this.ABS,
    this.rearDefogger, this.reverseCamera, this.electrical, this.interior,this.custom,this.powerWindowLHSFront,
    this.powerWindowLHSRear,this.powerWindowRHSFront, this.powerWindowRHSRear,this.rating});

  factory ElectricModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return ElectricModel(airbagFeature: json['airbagFeature'],ABS: json['airbagFeature'],electrical: json['electrical'],
          fabricSeat: json['fabricSeat'],interior: json['interior'],leatherSeat: json['leatherSeat'],musicSystem: json['musicSystem'],
          rearDefogger: json['rearDefogger'],reverseCamera: json['reverseCamera'],steelMountedAudioControl: json['steelMountedAudioControl'],
          sunroof: json['sunroof'],powerWindowLHSFront: json['powerWindow']['LHSFront'],powerWindowLHSRear:  json['powerWindow']['LHSRear'],
          powerWindowRHSFront: json['powerWindow']['RHSFront'],powerWindowRHSRear: json['powerWindow']['RHSRear'],rating: json["rating"]
      );
    }catch(e){
      print('Exceptio ElectricModelClass e:'+e.toString());
      return null;
    }
  }

  factory ElectricModel.fromJSONR(Map<dynamic,dynamic> json){
    try{
      return ElectricModel(airbagFeature: json['airbagFeature'],ABS: json['airbagFeature'],electrical: json['electrical'],
          fabricSeat: json['fabricSeat'],interior: json['interior'],leatherSeat: json['leatherSeat'],musicSystem: json['musicSystem'],
          rearDefogger: json['rearDefogger'],reverseCamera: json['reverseCamera'],steelMountedAudioControl: json['steelMountedAudioControl'],
          sunroof: json['sunroof'],powerWindowLHSFront: json['LHSFront'],powerWindowLHSRear:  json['LHSRear'],
          powerWindowRHSFront: json['RHSFront'],powerWindowRHSRear: json['RHSRear'],rating: json["rating"]
      );
    }catch(e){
      print('Exceptio ElectricModelClass e:'+e.toString());
      return null;
    }
  }

  Map toJson()=>{
        "powerWindow":{"LHSFront":powerWindowLHSFront,"LHSRear":powerWindowLHSRear,"RHSFront":powerWindowRHSFront,"RHSRear":powerWindowRHSRear},"airbagFeature":airbagFeature,
    "musicSystem":musicSystem,"leatherSeat":leatherSeat,"fabricSeat":fabricSeat,"sunroof":sunroof,"steelMountedAudioControl":steelMountedAudioControl,"ABS":ABS,
    "rearDefogger":rearDefogger,"reverseCamera":reverseCamera,"electrical":electrical,"interior":interior,"rating":rating
  };

  List <Widget>getCustmoWidgets(){
    List <Widget> customRows = new List();
    for (int i=0;i<custom.length;i++){
      customRows.add(SizedBox(height: 10,));
      customRows.add(Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(custom[i]['cname']),
          SizedBox(width: 50,),
          Text(custom[i]['value'])
        ],
      )
      );
      customRows.add(SizedBox(height: 10,));
    }
    return customRows;
  }
}