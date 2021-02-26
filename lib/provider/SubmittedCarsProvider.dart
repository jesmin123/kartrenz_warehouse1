import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/CarWarehouseModel.dart';

class SubmittedCarsProvider extends ChangeNotifier{

  List<CarWarehouseModel> _submittedCars;
  List<CarWarehouseModel> _acceptedCars;



  List<CarWarehouseModel> _modifyCars;
  List<CarWarehouseModel> _rejectedCars;

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
      if(element.status == "APPROVED" || element.status == "PENDING"){
        acceptedCars.add(element);
      }else if(element.status == "REJECTED"){
        rejectedCars.add(element);
      }else if(element.status == "MODIFY"){
        modifyCars.add(element);
      }

    });
  }

  List<CarWarehouseModel> get modifyCars => _modifyCars;

  set modifyCars(List<CarWarehouseModel> value) {
    _modifyCars = value;
    notifyListeners();
  }

  List<CarWarehouseModel> get rejectedCars => _rejectedCars;

  set rejectedCars(List<CarWarehouseModel> value) {
    _rejectedCars = value;
    notifyListeners();
  }

  List<CarWarehouseModel> get acceptedCars => _acceptedCars;

  set acceptedCars(List<CarWarehouseModel> value) {
    _acceptedCars = value;
    notifyListeners();
  }
}