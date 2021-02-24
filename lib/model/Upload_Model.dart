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

class DocumentDetails{
  String manufacturingMonth;
  String chassisNo;
  String cnglpg;
  String registrationDate;
  String insuranceType;
  String insuranceExpiryDate;
  String noclaimBonus;
  String noclaimBonusPercentage;
  String fitnessUpto;
  String rCAvailability ;
  String rCcondition;
  String partipheshiRequest;
  String roadtaxPaid;
  String rTONOCissued;
  String underHypothecation;
  String duplicateKey;

  DocumentDetails({
      this.manufacturingMonth,
      this.chassisNo,
      this.cnglpg,
      this.registrationDate,
      this.insuranceType,
      this.insuranceExpiryDate,
      this.noclaimBonus,
      this.noclaimBonusPercentage,
      this.fitnessUpto,
      this.rCAvailability,
      this.rCcondition,
      this.partipheshiRequest,
      this.roadtaxPaid,
      this.rTONOCissued,
      this.underHypothecation,
      this.duplicateKey});

  factory DocumentDetails.fromJSON(Map<String,dynamic>json){
    try{
      return DocumentDetails(chassisNo: json['chassisNo'], cnglpg: json['cnglpg'], duplicateKey: json['duplicateKey'],
          fitnessUpto: json['fitnessUpto'], insuranceExpiryDate: json['insuranceExpiryDate'], insuranceType: json['insuranceType'],
          manufacturingMonth: json['manufacturingMonth'], noclaimBonus: json['noclaimBonus'],
          noclaimBonusPercentage: json['noclaimBonusPercentage'], partipheshiRequest: json['partipheshiRequest'],
          rCAvailability: json['rCAvailability'], rCcondition: json['rCcondition'], registrationDate: json['registrationDate'],
          roadtaxPaid: json['roadtaxPaid'], rTONOCissued: json['rTONOCissued'], underHypothecation: json['underHypothecation']
      );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }

  Map<String, dynamic> toJson()=>{
    "chassisNo" : chassisNo,
    "cnglpg" : cnglpg,
    "duplicateKey" : duplicateKey,
    "fitnessUpto" : fitnessUpto,
    "insuranceExpiryDate" : insuranceExpiryDate,
    "insuranceType" : insuranceType,
    "manufacturingMonth" : manufacturingMonth,
    "noclaimBonus" : noclaimBonus,
    "noclaimBonusPercentage" : noclaimBonusPercentage,
    "partipheshiRequest" : partipheshiRequest,
    "rCAvailability" : rCAvailability,
    "rCcondition" : rCcondition,
    "registrationDate" : registrationDate,
    "roadtaxPaid" : roadtaxPaid,
    "rTONOCissued" : rTONOCissued,
    "underHypothecation" : underHypothecation,
  };

}

