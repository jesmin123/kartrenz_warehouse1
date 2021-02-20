import 'dart:convert';

import 'AuctionModel.dart';
import 'CarModel.dart';



class CarWarehouseModel{

  DateTime _dueDate= DateTime.now();
  String _imageUrl;
  bool isSold;
  AuctionModel _auction;
  String _auctionId;
  int auctionBidPrice;
  String id;
  Car car;
  String year="";
  String fuel="";
  String variant="";
  String kilometers="";
  String regNo="";
  String rCNo="";
  int basePrice=0;
  List<dynamic> highlights  = new List();
  String engine='';
  String engineVideo;
  String engineSound='';
  String exhaustSmoke="";
  String engineMounting="";
  String clutch="";
  String gearShifting="";
  String engineOil="";
  String engineOilLevelDipstick="";
  String battery="";
  String coolant="";
  String supportNo="";
  String code="";
  dynamic airConditioning;
  dynamic electricals;
  dynamic documentDetails;
  dynamic steeringSuspensionAndBrakes;
  dynamic exteriorPlusTyres;
  bool  isAuction;
  bool isApproved;
  String status="";
  int ratingDetails=0;
  int ratingEngine=0;

  CarWarehouseModel({this.id,this.auctionBidPrice,this.car,this.isSold, this.year, this.fuel, this.variant, this.basePrice,
    this.kilometers, this.regNo, this.rCNo, this.highlights, this.engine,
    this.engineVideo, this.engineSound, this.exhaustSmoke,
    this.engineMounting, this.clutch, this.gearShifting, this.engineOil,
    this.engineOilLevelDipstick, this.battery, this.coolant,
    this.airConditioning, this.electricals, this.documentDetails,
    this.steeringSuspensionAndBrakes, this.isAuction, this.isApproved,
    this.status, this.ratingDetails, this.ratingEngine,this.supportNo,this.exteriorPlusTyres,this.code});

  factory CarWarehouseModel.fromJSON(Map<dynamic, dynamic> json){
    try{
      return CarWarehouseModel(supportNo:json['supportNo'],id:json['_id'],engineSound: json['engineSound'],isSold:json['isSold'],auctionBidPrice: json['basePrice'],car: Car.fromJSON(json['car']),year: json['year'],fuel: json['fuel'],variant: json['variant'],basePrice: json['basePrice'],
          kilometers: json['kilometers'],regNo: json['regNo'],rCNo:  json['rCNo'],highlights: json['highlights'],engine: json['engine'],
          engineVideo: json['engineVideo'],exhaustSmoke: json['exhaustSmoke'],engineMounting: json['engineMounting'],clutch: json['clutch'],
          gearShifting: json['gearShifting'], engineOil: json['engineOil'],engineOilLevelDipstick: json['engineOilLevelDipstick'],
          battery: json['battery'], coolant: json['coolant'],airConditioning: json['airConditioning'],electricals: json['electricals'],
          documentDetails: json['documentDetails'],steeringSuspensionAndBrakes: json['steeringSuspensionAndBrakes'], isAuction: json['isAuction'],
          isApproved: json['isApproved'],status: json['status'],ratingDetails: json['ratingDetails'],ratingEngine: json['ratingEngine'],exteriorPlusTyres: json['exteriorPlusTyres'],
          code: json['code']
      );
    }catch (e){
      print("Warehouse Model Exception : "+ e.toString());
      return null;
    }
  }

  String getTrimmedRegNo(){
    return regNo.substring(0,5);
  }

  String getFuelType(){
    return fuel.substring(0,1).toUpperCase();
  }

  String getAmount(){
    if(basePrice!=null){
      if(basePrice>100000){
        return (basePrice/100000).toString() + 'L';
      }
      else if(basePrice>1000){
        return (basePrice/1000).toString() + 'K';
      }
      else{
        return basePrice.toString();
      }
    }else{
      return "0";
    }
  }

  String getBidAmount(){
    if(auctionBidPrice!=null){
      if(auctionBidPrice>100000){
        return (auctionBidPrice/100000).toString() + 'L';
      }
      else if(auctionBidPrice>1000){
        return (auctionBidPrice/1000).toString() + 'K';
      }
      else{
        return auctionBidPrice.toString();
      }
    }else{
      return getAmount();
    }
  }

  getEngineDetails(){
    Map engineDetails = {
      'engine': engine,
      'engineSound' : engineSound,
      'engineVideo':engineVideo,
      'exhaustSmoke': exhaustSmoke,
      'engineMounting': engineMounting,
      'clutch': clutch,
      'gearShifting':gearShifting,
      'engineOil ':engineOil,
      'engineOilLevelDipstick': engineOilLevelDipstick,
      'battery ':battery,
      'coolant': coolant,
    };
    return engineDetails;
  }

  set auctionId(String value) {
    _auctionId = value;
  }

  void setAuctionBidPrice(int price){
    auctionBidPrice = price;
  }

  int getTradeAmount(){
    int amount = basePrice;
    if(auction!=null && auction.highestBid!=0){
      amount = auction.highestBid;
    }
    return amount;
  }

  String get auctionId => _auctionId;

  AuctionModel get auction => _auction;

  set auction(AuctionModel value) {
    _auction = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  DateTime get dueDate => _dueDate;

  set dueDate(DateTime value) {
    _dueDate = value;
  }


}