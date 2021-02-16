import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class ElectricalFormProvider extends ChangeNotifier{


  Map<String, dynamic> _radioItems = {
    "LHS Front" : 0,
    "LHS Rear" : 0,
    "RHS Front" : 0,
    "RHS Rear" : 0,
    "Reverse Camera" : 0,
    "Airbag Feature" : 0,
    "Music System" : 0,
    "Leather Seat" : 0,
    "Fabric Seat" : 0,
    "Sun Roof" : 0,
    "Steering Mounted" : 0,
    "ABS" : 0,
    "Rear Defogger" : 0,
    "Electrical" : 0,
    "Interior" : 0,

  };

  Map<String, dynamic> get radioItems => _radioItems;

  set radioItems(Map<String, dynamic> value) {
    _radioItems = value;
    notifyListeners();
  }

  updateRadioItems(String key, dynamic value){
    Map<String, dynamic>  radioItemsTemp = radioItems;
    if(radioItemsTemp.containsKey(key)){
      radioItemsTemp[key] = value;
    }
    radioItems = radioItemsTemp;
  }

  Map<String, PlatformFile> _electricalImages = {
    "LHS Front" : null,
    "LHS Rear" : null,
    "RHS Front" : null,
    "RHS Rear" : null,
    "Reverse Camera" : null,
    "Airbag Feature" : null,
    "Music System" : null,
    "Leather Seat" : null,
    "Fabric Seat" : null,
    "Sun Roof" : null,
    "Steering Mounted" : null,
    "ABS" : null,
    "Rear Defogger" : null,
    "Electrical" : null,
    "Interior" : null,
  };

  Map<String, PlatformFile> get electricalImages => _electricalImages;

  set electricalImages(Map<String, PlatformFile> value) {
    _electricalImages = value;
    notifyListeners();
  }

  updateImage(String key, PlatformFile image){
    Map<String, PlatformFile> electricalImagesTemp = electricalImages;
    if(electricalImagesTemp.containsKey(key)){
      electricalImagesTemp[key] = image;
    }
    electricalImages = electricalImagesTemp;
  }

  removeFromImage(String key){
    Map<String, PlatformFile> electricalImagesTemp = electricalImages;
    electricalImagesTemp.remove(key);
    electricalImages = electricalImagesTemp;
  }


  List<PlatformFile> _damageImage = [];

  List<PlatformFile> get damageImage => _damageImage;

  set damageImage(List<PlatformFile> value) {
    _damageImage = value;
    notifyListeners();
  }

  void addToDamageImage(List <PlatformFile> images){
    List<PlatformFile> damageImageTemp = damageImage;
    damageImageTemp.addAll(images);
    damageImage = damageImageTemp;
  }

  void removeFromDamageImage(int index){
    List<PlatformFile> damageImageTemp = damageImage;
    damageImageTemp.removeAt(index);
    damageImage = damageImageTemp;
  }

  double _electricalRating = 3.5;

  double get electricalRating => _electricalRating;

  set electricalRating(double value) {
    _electricalRating = value;
    notifyListeners();
  }
}