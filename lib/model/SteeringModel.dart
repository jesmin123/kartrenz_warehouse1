class SteeringModel{
  String steering;
  String suspension;
  String brake;
  int rating;

  SteeringModel({this.steering, this.suspension, this.brake, this.rating});

  factory SteeringModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return SteeringModel(rating: json['rating'],brake: json['brake'],steering: json['steering'],suspension: json['suspension']);
    }catch(e){
      print("Exception e : "+e.toString());
      return null;
    }
  }

}