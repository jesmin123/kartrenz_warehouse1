import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageModel{
  int type;
  String name;
  String value;
  String id;
  String car;
  String createdOn;
  String image;

  ImageModel({this.type, this.name, this.value, this.id, this.car,
      this.createdOn, this.image});

factory ImageModel.fromJSON(Map<dynamic,dynamic> json){
  try{
    return ImageModel(type: json["type"],name: json["name"],value: json['value'],id: json["_id"],car: json["car"],createdOn: json["createdon"],image: json['image'] );
  }catch(e){
    print(e.toString());
    return null;
  }
}
}