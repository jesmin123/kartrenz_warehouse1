class ACModel {
  String ACCooling=" ";
  String   Heater=" ";
  String ClimateChangeControlAC=" ";
  String  BlowerMotorNoise=" ";
  int  rating= 0;

  ACModel({this.ACCooling, this.Heater, this.ClimateChangeControlAC,
    this.BlowerMotorNoise, this.rating});

  factory ACModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return ACModel(ACCooling: json['ACCooling'],BlowerMotorNoise: json['BlowerMotorNoise'],ClimateChangeControlAC: json['ClimateChangeControlAC'],
          Heater: json['Heater'],rating: json['rating']
      );
    }catch(e){
      print("Exception ; e "+e.toString());
      return null;
    }
  }
}