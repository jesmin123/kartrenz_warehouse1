import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';

class SubmittedCarsProvider extends ChangeNotifier{

  List<CarWarehouseModel> _submittedCars;

  List<CarWarehouseModel> get submittedCars => _submittedCars;

  set submittedCars(List<CarWarehouseModel> value) {
    _submittedCars = value;
    notifyListeners();
  }


  Future getSubmittedCars(String token)async{
    List<CarWarehouseModel> temp=[];
    api.getData("carwarehouse/cars/my/full",header: token).then((respObj) {
      if(respObj.status){
        List<dynamic> data=respObj.data;
        data.forEach((element) {
          element=element["_doc"];
          CarWarehouseModel carWarehouseModel=CarWarehouseModel.fromJSON(element);
          if(carWarehouseModel!=null){
            temp.add(carWarehouseModel);
          }
        });
      }
      submittedCars=temp;
    });
    submittedCars.forEach((element) {

    });
  }



}