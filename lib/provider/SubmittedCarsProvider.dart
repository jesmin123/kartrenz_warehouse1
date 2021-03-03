import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/model/RespObj.dart';

class SubmittedCarsProvider extends ChangeNotifier{

  List<CarWarehouseModel1> _submittedCars;
  List<CarWarehouseModel1> _acceptedCars;



  List<CarWarehouseModel1> _modifyCars;
  List<CarWarehouseModel1> _rejectedCars;

  List<CarWarehouseModel1> get submittedCars => _submittedCars;

  set submittedCars(List<CarWarehouseModel1> value) {
    _submittedCars = value;
    notifyListeners();

  }


  Future getSubmittedCars(String token)async{
    List<CarWarehouseModel1> temp=[];
    List<CarWarehouseModel1> acceptedTemp=[];
    List<CarWarehouseModel1> rejectedTemp=[];
    List<CarWarehouseModel1> modifyTemp=[];
    List<CarWarehouseModel1> submittedTemp=[];
    api.getData("carwarehouse/cars/my/full",header: token).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          element=element["_doc"];
          CarWarehouseModel1 carWarehouseModel=CarWarehouseModel1.fromJSON(element);
          if(carWarehouseModel!=null){
            temp.add(carWarehouseModel);
          }
        });
      }
      temp.forEach((element) {
        if(element.status == "APPROVED"){
          acceptedTemp.add(element);
        }else if(element.status == "REJECTED"){
          rejectedTemp.add(element);
        }else if(element.status == "MODIFY"){
          modifyTemp.add(element);
        }else if(element.status == "PENDING"){
          submittedTemp.add(element);
        }
    });
      acceptedCars=acceptedTemp;
      rejectedCars=rejectedTemp;
      modifyCars=modifyTemp;
      submittedCars=submittedTemp;


    });
  }

  List<CarWarehouseModel1> get modifyCars => _modifyCars;

  set modifyCars(List<CarWarehouseModel1> value) {
    _modifyCars = value;
  }

  List<CarWarehouseModel1> get rejectedCars => _rejectedCars;

  set rejectedCars(List<CarWarehouseModel1> value) {
    _rejectedCars = value;
  }

  List<CarWarehouseModel1> get acceptedCars => _acceptedCars;

  set acceptedCars(List<CarWarehouseModel1> value) {
    _acceptedCars = value;

  }

  Future<bool> delete(String token,String id)async{
    Map sendData = {"id": id};
    RespObj respObj = await api.postData("carwarehouse/delete",header: token, mBody: jsonEncode(sendData));
      if(respObj.status){
        await getSubmittedCars(token);
      }
      return respObj.status;
  }
}