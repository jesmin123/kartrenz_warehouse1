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

}