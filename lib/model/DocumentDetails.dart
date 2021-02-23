import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentData {
  String manufacturingYr=" ";
  String chassisNoEmossing=" ";
  String CNGLPGFitment=" ";
  String registrationDate=" ";
  String  insuranceType=" ";
  String insuranceExpiryDate=" ";
  String noclaimBonus=" ";
  String noclaimBonusPercentage=" ";
  String fitnessupto=" ";
  String RCavailability=" ";
  String RCCondition=" ";
  String RTO=" ";
  String partipheshiRequest=" ";
  String roadTaxpaid=" ";
  String RTONOCissued=" ";
  String underHypothecation=" ";
  String duplicateKey=" ";
  dynamic custom;

  DocumentData({this.manufacturingYr, this.chassisNoEmossing, this.CNGLPGFitment,
    this.registrationDate, this.insuranceType, this.insuranceExpiryDate,
    this.noclaimBonus, this.noclaimBonusPercentage, this.fitnessupto,
    this.RCavailability, this.RCCondition, this.RTO, this.partipheshiRequest,
    this.roadTaxpaid, this.RTONOCissued, this.underHypothecation,
    this.duplicateKey,this.custom});

  factory DocumentData.fromJSON(Map<dynamic,dynamic> json){
    try{
      return DocumentData(manufacturingYr: json['manufacturingYr']!=null?json['manufacturingYr']:"No Data",chassisNoEmossing: json['chassisNoEmossing']!=null?json['chassisNoEmossing']:"No Data",CNGLPGFitment: json['CNGLPGFitment']!=null?json['CNGLPGFitment']:"No Data",
          duplicateKey: json['duplicateKey']!=null?json['duplicateKey']:"No Data",fitnessupto: json['fitnessupto']!=null?json['fitnessupto']:"No Data",insuranceExpiryDate: json['insuranceExpiryDate']!=null?json['insuranceExpiryDate']:"No Data",insuranceType: json['insuranceType']!=null?json['insuranceType']: "No Data",
          noclaimBonus: json['noclaimBonus'],noclaimBonusPercentage: json['noclaimBonusPercentage'],partipheshiRequest: json['partipheshiRequest'],
          custom: json['custom'],RCavailability: json['RCavailability']!=null? json['RCavailability']:"No Data",RCCondition: json['RCCondition']!=null?json['RCCondition']:"No Data",registrationDate: json['registrationDate']!=null?json['registrationDate']:"No Data",
          roadTaxpaid: json['roadTaxpaid']!=null?json['roadTaxpaid']:"No Data",RTO: json['RTO']!=null?json['RTO']:'No Data',RTONOCissued: json['RTONOCissued']!=null?json['RTONOCissued']:"No Data",underHypothecation: json['underHypothecation']!=null?json['underHypothecation']:"No Data"
      );
    }catch(e){
      print("Exception e: "+e.toString());
      return null;
    }
  }

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
          Text(custom[i]['value']),
          Divider(),
        ],
      )
      );
      customRows.add(SizedBox(height: 10,));
    }
    return customRows;
  }
}