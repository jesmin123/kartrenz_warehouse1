
import 'package:kartenz/model/AieConditioningModel.dart';
import 'package:kartenz/model/ElectricalsModel.dart';
import 'package:kartenz/model/ExteriorTyresModel.dart';
import 'package:kartenz/model/SteeringModel.dart';
import 'package:kartenz/model/Upload_Model/DocumentDetails.dart';

class UploadCar{
  String createdBy;
  bool  isAuction;
  bool isApproved;
  String supportNo;

  String car;
  String carMake;
  String year;
  String fuel;
  String variant;
  String kilometers;
  String regNo;
  String rCNo;
  String description;
  List<dynamic> highlights;
  int basePrice;
  int expectedPrice;
  String engine;
  String engineVideo;
  String engineSound;
  String exhaustSmoke;
  String engineMounting;
  String clutch;
  String gearShifting;
  String engineOil;
  String engineOilLevelDipstick;
  String battery;
  String coolant;

  DocumentData documentData;
  ACModel acModel;
  ElectricModel electricModel;
  ExteriorTyresModel exteriorTyresModel;
  SteeringModel steeringModel;

  String state;
  String office;
  String reno;
  String ratingDetails;
  String ratingEngine;

  UploadCar({
      this.createdBy,
      this.isAuction,
      this.isApproved,
      this.supportNo,
      this.documentData,
      this.car,
      this.carMake,
      this.year,
      this.fuel,
      this.variant,
      this.kilometers,
      this.regNo,
      this.rCNo,
      this.description,
      this.highlights,
      this.basePrice,
      this.expectedPrice,
      this.engine,
      this.engineVideo,
      this.engineSound,
      this.exhaustSmoke,
      this.engineMounting,
      this.clutch,
      this.gearShifting,
      this.engineOil,
      this.engineOilLevelDipstick,
      this.battery,
      this.coolant,
      this.acModel,
      this.electricModel,
      this.exteriorTyresModel,
      this.steeringModel,
      this.state,
      this.office,
      this.reno,
      this.ratingDetails,
      this.ratingEngine});

  Map toJson()=>{
    "createdBy":createdBy,"isApproved":false,"isAuction":false,"supportNo":supportNo,"documentDetails":documentData.toJson(),"car":car,"carMake":"sample",
    "year":year,"fuel":fuel,"variant":variant,"kilometers":kilometers,"regNo":regNo,"rCNo":regNo,"description":description,"highlights":highlights,"basePrice":basePrice,
    "expectedPrice":expectedPrice,"engine":engine,"engineVideo":engineVideo,"engineSound":engineSound,"exhaustSmoke":exhaustSmoke,"engineMounting":engineMounting,"clutch":clutch,
    "gearShifting":gearShifting,"engineOil":engineOil,"engineOilLevelDipstick":engineOilLevelDipstick,"battery":battery,"coolant":coolant,"airConditioning":acModel.toJson(),
  "electricals":electricModel.toJson(),"exteriorPlusTyres":exteriorTyresModel.toJson(),"steeringSuspensionAndBrakes":steeringModel.toJson(),"state":state,"office":office,
    "reno":reno,"ratingDetails":ratingDetails,"ratingEngine":"4"
  };

  initConstructor(){
    documentData = DocumentData();
    acModel = ACModel();
    electricModel =ElectricModel();
    exteriorTyresModel = ExteriorTyresModel();
    steeringModel = SteeringModel();
  }
}