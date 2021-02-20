class StateModel{
  String name;
  String _id;
  String code;

  StateModel(this.name, this._id, this.code);

  factory StateModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return StateModel(json['name'], json['_id'], json['code']);
    }catch(ex){
      print("State Model Exception ex : "+ex.toString());
      return null;
    }
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}