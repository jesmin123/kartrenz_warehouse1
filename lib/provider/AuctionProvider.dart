import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/api/File_Uploader.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/BuyModel.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';
import 'package:kartenz/model/ImageModel.dart';
import 'package:kartenz/model/RTOfficeModel.dart';
import 'package:kartenz/model/RespObj.dart';
import 'package:kartenz/model/StateModel.dart';
import 'package:kartenz/model/TransactionModel.dart';
import 'package:kartenz/model/Upload_Model/Upload_car_model.dart';
import 'package:kartenz/model/uploadedCars.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/electrical_form_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';

class AuctionProvider extends ChangeNotifier{

List<UploadedCars> _auction;
List<Transaction> _transactions;
List<BuyModel> _buyAll;
List<StateModel> _stateList;
List<RTOfficeModel> _listRtOffice;
List<CarWarehouseModel> _carReport;
String _id;
CarWarehouseModel _uploaded;

CarWarehouseModel get uploaded => _uploaded;

  set uploaded(CarWarehouseModel value) {
    _uploaded = value;
    notifyListeners();
  }

  String get id => _id;

  set id(String value) {
    _id = value;

  }

  List<CarWarehouseModel> get carReport => _carReport;

  set carReport(List<CarWarehouseModel> value) {
    _carReport = value;
    notifyListeners();
  }

  List<RTOfficeModel> get listRtOffice => _listRtOffice;

  set listRtOffice(List<RTOfficeModel> value) {
    _listRtOffice = value;
  }

  List<StateModel> get stateList => _stateList;

  set stateList(List<StateModel> value) {
    _stateList = value;
  }

  List<BuyModel> get buyAll => _buyAll;

set buyAll(List<BuyModel> value) {
  _buyAll = value;
  notifyListeners();
}

List<Transaction> get transactions => _transactions;

  set transactions(List<Transaction> value) {
    _transactions = value;
    notifyListeners();
  }

  List<UploadedCars> get auction => _auction;

  set auction(List<UploadedCars> value) {
    _auction = value;
    notifyListeners();
  }

  Future getAuctionsBuyAll(String token,String id) async{
    List<UploadedCars> temp = [];
    api.getData("auction/all",header:  token).then((respObj) {
      if(respObj.status){
        List<dynamic> datas = respObj.data;
        datas.forEach((element) {
          UploadedCars uploadedCars=UploadedCars.fromJSON(element);
          if(uploadedCars!=null && uploadedCars.cars.loginModel!=null){
            if(uploadedCars.cars.loginModel.id==id){
              temp.add(uploadedCars);
            }
          }
        });
      }
    auction=temp;
      allAuction = temp;
    });

  }

  Future getTransaction(String id,String token)async{
    Map sendData = {"createdBy":id};
    List<Transaction> temp=[];
    api.postData("transaction/createdBy",header: token,mBody: jsonEncode(sendData)).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          Transaction transaction=Transaction.fromJSON(element);
          if(transaction!=null){
            temp.add(transaction);
          }
        });
      }
      transactions=temp;
      allTransaction = temp;
      allTransactions = temp;
    } );
  }
  Future getBuyAllPurchase(String token,String id)async{
    List<BuyModel> temp=[];
    api.getData("buy/all",header: token).then((respObj){
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {

          BuyModel buyModel=BuyModel.fromJSON(element);
          if(buyModel!=null && buyModel.car.loginModel!=null){
            if(buyModel.car.loginModel.id==id) {
              temp.add(buyModel);
            } }
        });
      }
      buyAll=temp;
      allBuyNow = temp;
    });
  }
Future getStateList(String token)async{
    List<StateModel> temp=[];
    api.getData('state/all',header: token).then((respObj){
      if(respObj.status){
        List<dynamic> data = respObj.data;
        data.forEach((element) {
          StateModel stateModel=StateModel.fromJSON(element);
          if(stateModel!=null){
            temp.add(stateModel);
          }
        });
      }
      stateList=temp;
    });
}
Future postListRt(String token,String id)async{
    Map sendData={"state": id};
List<RTOfficeModel> temp=[];
api.postData("rtoffice/state",header: token,mBody: jsonEncode(sendData)).then((respObj) {
  if(respObj.status){
    List<dynamic> data=respObj.data;
    data.forEach((element) {
      RTOfficeModel rtOfficeModel=RTOfficeModel.fromJSON(element);
      if(rtOfficeModel!=null){
        temp.add(rtOfficeModel);
      }
    });
  }
  listRtOffice=temp;
});
}

String _selectedStateId;

String get selectedStateId => _selectedStateId;

  setSelectedStateId(String value, String token) {
    _selectedStateId = value;
    getRtOfficeList(value, token);
  }

  getRtOfficeList(String id, String token){
    stateList.forEach((element) {
     if(element.id ==id){
         postListRt(token, id);
     }
    });
  }


  Future postCarReport(String token,String id)async{
    Map sendData={"createdBy": id};
    List<CarWarehouseModel> temp=[];
    api.postData("carwarehouse/createdBy",header: token,mBody: jsonEncode(sendData)).then((respObj){
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          CarWarehouseModel carWarehouseModel=CarWarehouseModel.fromJSON(element);
          if(carWarehouseModel!=null){
            temp.add(carWarehouseModel);
          }
        });
      }
      carReport=temp;
    } );
}
Future postPaymentProceed(String token,String broker, int amount,bool completed,String car,String createdBy,String auction)async{

    Map sendData = {"broker":broker,"amount":amount,"completed":completed,"car":car,"createdBy":createdBy,"auction":auction};
    api.postData("transaction",header: token,mBody: jsonEncode(sendData)).then((respObj){
      if(respObj.status){
          getTransaction(createdBy, token);
      }
    } );
}

Future postUploadNewCar(String token) async{
    Map sendData={"createdBy":"5fdafc523121f4001fe27394","isApproved":false,"isAuction":false,"supportNo":"456963123","documentDetails":{"manufacturingYr":"12/2011","chassisNoEmossing":"852123","CNGLPGFitment":"sdfghj","registrationDate":"21-12-2011","insuranceType":"sdfghjk","insuranceExpiryDate":"zxcvbn","noclaimBonus":"okm edc","noclaimBonusPercentage":"15","fitnessupto":"dfghj","RCavailability":"pl,m","RCCondition":"qaz","RTO":"Malappuram","partipheshiRequest":"tfvc","roadTaxpaid":"tgb","RTONOCissued":"ewrtyui","underHypothecation":"edrfgh","duplicateKey":"w4erth","rating":3,"custom":[]},"car":"5fd858f43121f4001fe272b0","carMake":"sample","year":"2011","fuel":"petrol","variant":"qwerty","kilometers":"10000","regNo":"KL-10-NaN","rCNo":"KL-10-NaN","description":"QWERTY","highlights":[],"basePrice":14000,"expectedPrice":15000,"engine":"wqertyh","engineVideo":"","engineSound":"34ertgf","exhaustSmoke":"zxcvbn","engineMounting":"okm","clutch":"yhgb ","gearShifting":"rthjm","engineOil":"okmijn","engineOilLevelDipstick":"ygvtfc","battery":"rdxesz","coolant":"plkjmnkj","airConditioning":{"ACCooling":"no","Heater":"no","ClimateChangeControlAC":"no","BlowerMotorNoise":"yes","rating":3},"electricals":{"powerWindow":{"LHSFront":"no","LHSRear":"no","RHSFront":"no","RHSRear":"no"},"airbagFeature":"no","musicSystem":"no","leatherSeat":"no","fabricSeat":"no","sunroof":"no","steelMountedAudioControl":"na","ABS":"no","rearDefogger":"no","reverseCamera":"no","electrical":"no","interior":"no","rating":3,"custom":[]},"exteriorPlusTyres":{"Roof":"no","BonnetorHood":"no","DickyDoororBootDoor":"no","QuarterPanel":"NIL","QuarterPanelLHS":"no","QuarterPanelRHS":"no","Fender":"NIL","FenderLHS":"no","FenderRHS":"no","Pillar":"no","Apron":"no","Firewall":"no","CowlTop":"no","UpperCrossMember":"no","FrontShow":"NIL","LowerCrossMember":"no","RadiatorSupport":"no","RunningBorder":"NIL","RunningBorderLHS":"no","RunningBorderRHS":"no","Door":"NIL","DoorLHSFront":"no","DoorLHSRear":"no","DoorRHSFront":"no","DoorRHSRear":"no","BumperFront":"no","BumperRear":"no","WindshieldFront":"no","WindshieldBack":"no","LHSFogLight":"no","RHSFogLight":"no","LHSHeadlight":"no","LHSTaillight":"no","RHSHeadlight":"no","RHStaillight":"no","ORVM":"","ORVMLHS":"na","ORVMRHS":"na","AlloyWheels":"na","Tyre":"","LHSFrontTyre":"esdrfghj","RHSFrontTyre":"sdfg","LHSRearTyre":"wesrdfg","RHSRearTyre":"asdfgvb","SpareTyre":"ertgf","rating":3},"steeringSuspensionAndBrakes":{"steering":"dfgbnm,","suspension":"fhjnkm,","brake":"werdtfgh","rating":3},"state":"5fd8459b3121f4001fe2722b","office":"5fd846583121f4001fe27235","reno":null,"ratingDetails":"","ratingEngine":3};
    api.postData("carwarehouse",header: token , mBody: jsonEncode(sendData)).then((respObj) {
      id=respObj.data['_id'];
    });
}

List<Transaction> allTransaction = [];

  searchTransaction(String keyword){
      if(keyword==null || keyword.isEmpty){
        transactions = allTransaction;
      }
      List<Transaction> treansTemp = [];
      transactions.forEach((element) {
        if(element.broker.name.toUpperCase().contains(keyword.toUpperCase())){
          treansTemp.add(element);
        }
      });
      transactions = treansTemp;
  }

List<BuyModel> allBuyNow = [];
  searchBuyNow(String keyword){
    if(keyword==null || keyword.isEmpty){
      buyAll = allBuyNow;
    }
      List<BuyModel> buyNowTemp = [];
      buyAll.forEach((element) {
        if(element.car.regNo.toUpperCase().contains(keyword.toUpperCase())){
          buyNowTemp.add(element);
        }
      });
      buyAll = buyNowTemp;

  }

  List<UploadedCars> allAuction = [];
  searchAuction(String keyword){
    if(keyword==null || keyword.isEmpty){
      auction = allAuction;
    }
    List<UploadedCars> auctionTemp = [];
    auction.forEach((element) {
      if(element.cars.regNo.toUpperCase().contains(keyword.toUpperCase())){
        auctionTemp.add(element);
      }
    });
    auction = auctionTemp;
  }

  List<Transaction> allTransactions;
  serachSoldCar(String keyword){
    if(keyword==null || keyword.isEmpty){
      transactions = allTransactions;
    }
    List<Transaction> transactionTemp = [];
    transactions.forEach((element) {
      if(element.carWarehouseModel.regNo.toUpperCase().contains(keyword.toUpperCase())){
        transactionTemp.add(element);
      }
    });
    transactions = transactionTemp;
  }


List<ImageModel> _images;

List<ImageModel> get images => _images;

set images(List<ImageModel> value) {
  _images = value;
  notifyListeners();
}

Map<dynamic,List<ImageModel>> _carImages = {};


Map get carImages => _carImages;

  set carImages(Map value) {
    _carImages = value;
    notifyListeners();
  }

  Future postCarImage(String token,String id) async{

    Map<dynamic,List<ImageModel>> carImagesTemp = {};

    Map sendData={"car":id};
    List<ImageModel> temp=[];

    api.postData("carimage/car",header: token,mBody: jsonEncode(sendData)).then((respObj){
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          ImageModel imageModel=ImageModel.fromJSON(element);
          if(imageModel!=null){
            if(imageModel.name!=null && imageModel.name.isNotEmpty){
              if(carImagesTemp.containsKey(imageModel.name)){
                carImagesTemp[imageModel.name].add(imageModel);
              }
              else{
                carImagesTemp.putIfAbsent(imageModel.name, () => [imageModel]);
              }
            }else{
              if (carImagesTemp.containsKey(imageModel.type)) {
                carImagesTemp[imageModel.type]
                    .add(imageModel);
              }else{
                carImagesTemp.putIfAbsent(imageModel.type, () => [imageModel]);
              }
            }
          }
        });
        images=temp;
        carImages=carImagesTemp;
      }

    } );
}

  searchBetweenDate(DateTime startDate , DateTime endDate){
    List<Transaction> transtemp = [];
    transactions.forEach((element) {
      DateTime dt = DateTime.parse(element.date);
      if(dt.isBefore(endDate) &&  dt.isAfter(startDate)){
        transtemp.add(element);
      }
    });
    transactions = transtemp;
  }

  Future<RespObj> postUploadCar(String token, UploadCar uploadCar, FormData formData, BasicProvider basicProvider, ElectricalFormProvider electricalFormProvider) async{
    Map data = uploadCar.toJson();
    RespObj respObj = await api.postData("carwarehouse",mBody: jsonEncode(data),header: token,);
    if(respObj.status){
        dynamic data=respObj.data;
        String  id = data['_id'];
        fileUploader.uploadVideo("carwarehouse/engineVideo/upload", basicProvider.engineVideo, basicProvider.engineVideo.name,id: id,header: token).then((value) {
          if(value.status){
            print("Video Uploaded");
          }
        });

        Map sendData = {"car":id,"type":0,"name":""};
         api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
          if(value.status){
              String id = value.data["_id"];
              fileUploader.uploadFile("carimage/image/upload", formData.mainImage, formData.mainImage.name,id: id,header: token);
          }

        });
         
         sendData = {"car":id,"type":1,"name":""};
          api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
            if(value.status){
              String id = value.data["_id"];
              RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", formData.interiorImage.length>0?formData.interiorImage.first:null, formData.interiorImage.length>0?formData.interiorImage.first.name:" ",id: id,header: token);
            }
        });

        sendData = {"car":id,"type":2,"name":""};
        api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
          if(value.status){
            String id = value.data["_id"];
            RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", formData.exteriorImage.length>0?formData.exteriorImage.first:null, formData.exteriorImage.length>0?formData.exteriorImage.first.name:" ",id: id,header: token);
          }

        });

        sendData = {"car":id,"type":3,"name":""};
        api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
          if(value.status){
            String id = value.data["_id"];
            RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", formData.documentImages.length>0?formData.documentImages.first:null, formData.documentImages.length>0?formData.documentImages.first.name:" ",id: id,header: token);
          }

        });

        sendData = {"car":id,"type":4,"name":""};
        api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
          if(value.status){
            String id = value.data["_id"];
            RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", basicProvider.engineImages.length>0?basicProvider.engineImages.first:null, basicProvider.engineImages.length>0?basicProvider.engineImages.first.name:" ",id: id,header: token);
          }

        });

        sendData = {"car":id,"type":5,"name":""};
        api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async {
          if(value.status){
            String id = value.data["_id"];
            RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", electricalFormProvider.damageImage.length>0?electricalFormProvider.damageImage.first:null, electricalFormProvider.damageImage.length>0?electricalFormProvider.damageImage.first.name:"",id: id,header: token);
          }

          int i = 6;
          basicProvider.imagesDatat.forEach((key, img) {
            sendData = {"car":id,"name": key,"type":i};
            i = i+1;
            api.postData("carimage",header: token,mBody: jsonEncode(sendData)).then((value) async{
              if(value.status){
                String id = value.data["_id"];
                RespObj respObj = await fileUploader.uploadFile("carimage/image/upload", img, img.name,id: id,header: token);
              }
          });

        });

       
        // Engine Video -http://kartrenz.com:4000/carwarehouse/engineVideo/upload

        //To upload file
        // First fire at http://kartrenz.com:4000/carimage  {"car":"6049b439c5e7f7002b6f4db1","type":0,"name":""}
        // Get the id from above route
        // Then fire to http://kartrenz.com:4000/carimage/image/upload   id:kkk  image:"file"
        // Check if upload is success

      });
    }
    return respObj;
  }
}