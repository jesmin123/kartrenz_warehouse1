import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/BuyModel.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';
import 'package:kartenz/model/RTOfficeModel.dart';
import 'package:kartenz/model/StateModel.dart';
import 'package:kartenz/model/TransactionModel.dart';
import 'package:kartenz/model/uploadedCars.dart';

class AuctionProvider extends ChangeNotifier{

List<UploadedCars> _auction;
List<Transaction> _transactions;
List<BuyModel> _buyAll;
List<StateModel> _stateList;
List<RTOfficeModel> _listRtOffice;
List<CarWarehouseModel> _carReport;
String _id;

String get id => _id;

  set id(String value) {
    _id = value;
    notifyListeners();
  }

  List<CarWarehouseModel> get carReport => _carReport;

  set carReport(List<CarWarehouseModel> value) {
    _carReport = value;
    notifyListeners();
  }

  List<RTOfficeModel> get listRtOffice => _listRtOffice;

  set listRtOffice(List<RTOfficeModel> value) {
    _listRtOffice = value;
    notifyListeners();
  }

  List<StateModel> get stateList => _stateList;

  set stateList(List<StateModel> value) {
    _stateList = value;
    notifyListeners();
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

}