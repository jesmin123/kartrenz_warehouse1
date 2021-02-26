import 'package:flutter/material.dart';

class CustomerDetails{
  String carMake;
  String carModel;
  String fuel;
  String variant;
  String kms;
  String yearOfManufacture;
  String basePrice;
  String expectedPrice;
  String state;
  String rtOffice;
  String regNo;
  String description;
  String supportNumber;
  List<String> highlightFeature;

  CustomerDetails({
      this.carMake,
      this.carModel,
      this.fuel,
      this.variant,
      this.kms,
      this.yearOfManufacture,
      this.basePrice,
      this.expectedPrice,
      this.state,
      this.rtOffice,
      this.regNo,
      this.description,
      this.supportNumber,
      this.highlightFeature});

  factory CustomerDetails.fromJSON(Map<String,dynamic>json){
    try{
      return CustomerDetails(variant: json['variant'], carModel: json['carModel'], carMake: json['carMake'],
          state: json['state'], basePrice: json['basePrice'], description: json['description'],
          expectedPrice: json['expectedPrice'], fuel: json['fuel'], highlightFeature: json['highlightFeature'],
        kms: json['kms'], regNo: json['regNo'], rtOffice: json['rtOffice'], supportNumber: json['supportNumber'],
          yearOfManufacture: json['yearOfManufacture']
      );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }

  Map<String, dynamic> toJson()=>{
    "variant" : variant,
    "carModel" : carModel,
    "carMake" : carMake,
    "state" : state,
    "basePrice" : basePrice,
    "description" : description,
    "expectedPrice" : variant,
    "fuel" : fuel,
    "highlightFeature" : highlightFeature,
    "kms" : kms,
    "regNo" : regNo,
    "rtOffice" : rtOffice,
    "supportNumber" : supportNumber,
    "yearOfManufacture" : yearOfManufacture,
};

}



