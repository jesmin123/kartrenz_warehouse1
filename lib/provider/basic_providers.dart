import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BasicProvider extends ChangeNotifier{

  PlatformFile _engineVideo;

  PlatformFile get engineVideo => _engineVideo;

  set engineVideo(PlatformFile value) {
    _engineVideo = value;
    notifyListeners();
  }

  void removeEngineVideo(){
  }

  List<PlatformFile> _engineImages;

  List<PlatformFile> get engineImages => _engineImages!=null?_engineImages:[];

  set engineImages(List<PlatformFile> value) {
    _engineImages = value;
    notifyListeners();
  }

  void addToEngineImages(List<PlatformFile> newImages){
    List<PlatformFile> engineImageTemp = engineImages;
    engineImageTemp.addAll(newImages);
    engineImages = engineImageTemp;
  }

  void removeFromEngineImages(int index){
    List<PlatformFile> engineImageTemp = engineImages;
    engineImageTemp.removeAt(index);
    engineImages = engineImageTemp;
  }

  double _engineRating = 3.5;

  double get engineRating => _engineRating;

  set engineRating(double value) {
    _engineRating = value;
    notifyListeners();
  }

  Map<String, dynamic> _radioItem = {
    "AC Cooling" : 0,
    "Heater" : 0,
    "Climate" : 0,
    "Blower" : 0
  };

  Map<String, dynamic> get radioItem => _radioItem;

  set radioItem(Map<String, dynamic> value) {
    _radioItem = value;
    notifyListeners();
  }

  updateRadioItem(String key, dynamic value){
    Map<String, dynamic> radioItemTemp = radioItem;
    if(radioItemTemp.containsKey(key)){
      radioItemTemp[key] = value;
    }
    radioItem = radioItemTemp;
  }
  Map<String, PlatformFile> _images = {
    "AC Cooling" : null,
    "Heater" : null,
    "Climate" : null,
    "Blower" : null,
  };


  Map<String, PlatformFile> get images => _images;

  set images(Map<String, PlatformFile> value) {
    _images = value;
    notifyListeners();
  }

  updateImage(String key, PlatformFile value){
    Map<String, PlatformFile> imageTemp = images;
    if(imageTemp.containsKey(key)){
      imageTemp[key] = value;
    }
    images = imageTemp;
  }

  removeImage(String key){
    Map<String, PlatformFile> imageTemp = images;
    imageTemp.remove(key);
    images = imageTemp;
  }

  double _airConditionRating = 3.5;

  double get airConditionRating => _airConditionRating;

  set airConditionRating(double value) {
    _airConditionRating = value;
    notifyListeners();
  }
}