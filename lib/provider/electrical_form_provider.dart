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
    "powerWindowLHSFront" : null,
    "powerWindowLHSRear" : null,
    "powerWindowRHSFront" : null,
    "powerWindowRHSRear" : null,
    "reverseCamera" : null,
    "airbagFeature" : null,
    "musicSystem" : null,
    "leatherSeat" : null,
    "fabricSeat" : null,
    "sunroof" : null,
    "Steering Mounted" : null,
    "ABS" : null,
    "rearDefogger" : null,
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

  Map<String, dynamic> _exteriorRadioItem = {
    "Roof" : 0,
    "Bonnet" : 0,
    "Dicky Door" : 0,
    "Quarter LHS" : 0,
    "Quarter RHS" : 0,
    "Fender LHS" : 0,
    "Fender RHS" : 0,
    "Pillar" : 0,
    "Apron" : 0,
    "Firewall" : 0,
    "CowlTop" : 0,
    "Upper Cross" : 0,
    "Lower Cross" : 0,
    "Radiator" : 0,
    "Running LHS" : 0,
    "Running RHS" : 0,
    "RHS Front" : 0,
    "RHS Rear" : 0,
    "LHS Front" : 0,
    "LHS Rear" : 0,
    "Bumper Front" : 0,
    "Bumper Rear" : 0,
    "Wind Shield Front" : 0,
    "Wind Shield Rear" : 0,
    "LHS Fog" : 0,
    "RHS Fog" : 0,
    "LHS Headlight" : 0,
    "LHS Taillight" : 0,
    "RHS Headlight" : 0,
    "RHS Taillight" : 0,
    "ORVM LHS" : 0,
    "ORVM RHS" : 0,
    "Alloy Wheels" : 0,
  };

  Map<String, dynamic> get exteriorRadioItem => _exteriorRadioItem;

  set exteriorRadioItem(Map<String, dynamic> value) {
    _exteriorRadioItem = value;
    notifyListeners();
  }

  updateExteriorradioItem(String key, String value){
    Map<String, dynamic>  exteriorRadioItemTemp = exteriorRadioItem;
    if(exteriorRadioItemTemp.containsKey(key)){
      exteriorRadioItemTemp[key] = value;
    }
    exteriorRadioItem = exteriorRadioItemTemp;
  }

  Map<String, PlatformFile> _exteriorImage = {
    "Roof" : null,
    "BonnetorHood" : null,
    "DickyDoororBootDoor" : null,
    "QuarterPanelLHS" : null,
    "QuarterPanelRHS" : null,
    "FenderLHS" : null,
    "FenderRHS" : null,
    "Pillar" : null,
    "Apron" : null,
    "Firewall" : null,
    "CowlTop" : null,
    "UpperCrossMember" : null,
    "LowerCrossMember" : null,
    "RadiatorSupport" : null,
    "RunningBorderLHS" : null,
    "RunningBorderRHS" : null,
    "DoorRHSFront" : null,
    "DoorRHSRear" : null,
    "DoorLHSFront" : null,
    "DoorLHSRear" : null,
    "BumperFront" : null,
    "BumperRear" : null,
    "WindshieldFront" : null,
    "WindshieldBack" : null,
    "LHSFogLight" : null,
    "RHSFogLight" : null,
    "LHSHeadlight" : null,
    "LHSTaillight" : null,
    "RHSHeadlight" : null,
    "RHSTaillight" : null,
    "ORVMLHS" : null,
    "ORVMRHS" : null,
    "AlloyWheels" : null,
  };


  Map<String, PlatformFile> get exteriorImage => _exteriorImage;

  set exteriorImage(Map<String, PlatformFile> value) {
    _exteriorImage = value;
    notifyListeners();
  }

  updateExteriorImage(String key, PlatformFile updateImage){
    Map<String, dynamic>  exteriorImageTemp = exteriorImage;
    if(exteriorImageTemp.containsKey(key)){
      exteriorImageTemp[key] = updateImage;
    }
    exteriorImage = exteriorImageTemp;

  }

  removeFromExteriorImage(String key){
    Map<String, dynamic>  exteriorImageTemp = exteriorImage;
    exteriorImageTemp.remove(key);
    exteriorImage = exteriorImageTemp;
  }

  Map<String, PlatformFile> _tyreImage = {
    "LHSFrontTyre": null,
    "RHSFrontTyre": null,
    "LHSRearTyre": null,
    "RHSRearTyre": null,
    "SpareTyre": null,
  };

  Map<String, PlatformFile> get tyreImage => _tyreImage;

  set tyreImage(Map<String, PlatformFile> value) {
    _tyreImage = value;
    notifyListeners();
  }

  updateTyreImage(String key, PlatformFile image){
    Map<String, PlatformFile>  tyreImageTemp = tyreImage;
    if(tyreImageTemp.containsKey(key)){
      tyreImageTemp[key] = image;
    }
    tyreImage = tyreImageTemp;
  }

  removeFromTyreImage(String key){
    Map<String, PlatformFile>  tyreImageTemp = tyreImage;
    tyreImageTemp.remove(key);
    tyreImage = tyreImageTemp;

  }

  double _exteriorRating = 3.5;

  double get exteriorRating => _exteriorRating;

  set exteriorRating(double value) {
    _exteriorRating = value;
    notifyListeners();
  }

  Map<String, PlatformFile> _steeringImage = {
    "steering" : null,
    "suspension" : null,
    "brake" : null
  };

  Map<String, PlatformFile> get steeringImage => _steeringImage;

  set steeringImage(Map<String, PlatformFile> value) {
    _steeringImage = value;
    notifyListeners();
  }

  updateSteeringImage(String key, PlatformFile image){
    Map<String, PlatformFile>  steeringImageTemp = steeringImage;
    if(steeringImageTemp.containsKey(key)){
      steeringImageTemp[key] = image;
    }
    steeringImage = steeringImageTemp;
  }

  removeFromSteeringImage(String key){
    Map<String, PlatformFile>  steeringImageTemp = steeringImage;
    steeringImageTemp.remove(key);
    steeringImage = steeringImageTemp;
  }

  double _steeringRating = 3.5;

  double get steeringRating => _steeringRating;

  set steeringRating(double value) {
    _steeringRating = value;
    notifyListeners();
  }
}