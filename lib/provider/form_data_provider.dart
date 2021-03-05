import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/model/CarModel.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/model/CompanyModel.dart';
import 'package:kartenz/model/RespObj.dart';
import 'package:kartenz/model/Upload_Model/DocumentDetails.dart';
import 'package:kartenz/model/Upload_Model/EngineModel.dart';
import 'package:kartenz/model/Upload_Model/Upload_Model.dart';
import 'package:kartenz/model/Upload_Model/Upload_car_model.dart';

class FormData extends ChangeNotifier{

  List<Company> _company;

  List<Company> get company => _company;

  set company(List<Company> value) {
    _company = value;
    notifyListeners();
  }

  List<Car> _sortedCarModel;


  List<Car> get sortedCarModel => _sortedCarModel;

  set sortedCarModel(List<Car> value) {
    _sortedCarModel = value;
    notifyListeners();
  }

  int _activeStep = 0;

  int get activeStep => _activeStep;

  set activeStep(int value) {
    _activeStep = value;
  }

  int _stepCount = 0;

  int get stepCount => _stepCount;

  set stepCount(int value) {
    _stepCount = value;
    notifyListeners();
  }

  String _radioItem = '';

  String get radioItem => _radioItem;

  set radioItem(String value) {
    _radioItem = value;
    uploadCar.fuel=value;
    notifyListeners();
  }

  String _dropdownValue;
  String _dropdownValue2;
  String _stateDropdown;
  String _rtOfficeDropdown;


  String get dropdownValue => _dropdownValue;

  set dropdownValue(String value) {
    _dropdownValue = value;
    notifyListeners();
  }

  List<String> _features;

  List<String> get features => _features!=null?_features:[];

  set features(List<String> value) {
    _features = value;
    notifyListeners();
  }

  void addToFeature(String feature){
    List<String>  highlightFeature = features;
    highlightFeature.add(feature);
    features = highlightFeature;
    uploadCar.highlights = features;
  }

  void removeFromfeature(String feature){
    List<String>  highlightFeature = features;
    highlightFeature.remove(feature);
    features = highlightFeature;

  }

  PlatformFile _mainImage;

  PlatformFile get mainImage => _mainImage;

  set mainImage(PlatformFile value) {
    _mainImage = value;
    notifyListeners();
  }

 List<PlatformFile> _interiorImage;

  List<PlatformFile> get interiorImage => _interiorImage!=null?_interiorImage:[];

  set interiorImage(List<PlatformFile> value) {
    _interiorImage = value;
    notifyListeners();
  }

  void addToInteriorImage(List<PlatformFile> newImage){
    List<PlatformFile> interiorImageTemp  = interiorImage;
    interiorImageTemp.addAll(newImage);
    interiorImage = interiorImageTemp;
  }

  void removeFromInteriorImage(int index){
    List<PlatformFile> interiorImageTemp  = interiorImage;
    interiorImageTemp.removeAt(index);
    interiorImage = interiorImageTemp;
  }

  List<PlatformFile> _exteriorImage;


  List<PlatformFile> get exteriorImage => _exteriorImage!=null?_exteriorImage:[];

  set exteriorImage(List<PlatformFile> value) {
    _exteriorImage = value;
    notifyListeners();
  }

  void addToExteriorImage(List<PlatformFile> newImage){
    List<PlatformFile> exteriorImageTemp = exteriorImage;
    exteriorImageTemp.addAll(newImage);
    exteriorImage = exteriorImageTemp;
  }

  void removeFromExteriorImage(int index){
    List<PlatformFile> exteriorImageTemp = exteriorImage;
    exteriorImageTemp.removeAt(index);
   exteriorImage = exteriorImageTemp;
  }

  double _rating = 3.5;

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
    notifyListeners();
  }

  List<PlatformFile> _documentImages = [];

  List<PlatformFile> get documentImages => _documentImages!=null?_documentImages:[];

  set documentImages(List<PlatformFile> value) {
    _documentImages = value;
    notifyListeners();
  }

  void addToDocumentImages(List<PlatformFile> newFiles){
    List<PlatformFile> documentImagesTemp = documentImages;
    documentImagesTemp.addAll(newFiles);
    documentImages = documentImagesTemp;
  }

  void removeFromDocumentImages(int index){
    List<PlatformFile> documentImagesTemp = documentImages;
    documentImagesTemp.removeAt(index);
    documentImages = documentImagesTemp;
  }

  String get dropdownValue2 => _dropdownValue2;

  set dropdownValue2(String value) {
    _dropdownValue2 = value;
    notifyListeners();
  }

  String get stateDropdown => _stateDropdown;

  set stateDropdown(String value) {
    _stateDropdown = value;
    notifyListeners();
  }

  String get rtOfficeDropdown => _rtOfficeDropdown;

  set rtOfficeDropdown(String value) {
    _rtOfficeDropdown = value;
    notifyListeners();
  }

int _current = 0;

  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  Future getCompany() async{
    RespObj respObj = await api.getData("company/get/lists");
    if(respObj.status){
      List<Company> companyTemp=[];
      List<dynamic> temp=respObj.data;
      temp.forEach((element) {
        Company company=Company.fromJSON(element);
        companyTemp.add(company);
      });
      _company=companyTemp;

  }
  }
  String _selectedCarMakeId;


  String get selectedCarMakeId => _selectedCarMakeId;

  set selectedCarMakeId(String value) {
    _selectedCarMakeId = value;
    getCarModel(value);
  }

  getCarModel(String id){
    company.forEach((element) {
     if( element.id == id){
       sortedCarModel = element.cars;
     }
    });
  }

  bool _passwordToggle = false;

  bool get passwordToggle => _passwordToggle;

  set passwordToggle(bool value) {
    _passwordToggle = value;
    notifyListeners();
  }

  int _radioList;


  int get radioList => _radioList;

  set radioList(int value) {
    _radioList = value;
    notifyListeners();

  }

  CarWarehouseModel1 _selectedCars;

  CarWarehouseModel1 get selectedCars => _selectedCars;

  set selectedCars(CarWarehouseModel1 value) {
    _selectedCars = value;
    notifyListeners();
  }

  UploadCar uploadCar;
}

