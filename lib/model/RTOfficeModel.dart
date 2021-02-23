

class RTOfficeModel{
  String name;
  String code;
  String _id;
  String state;

  RTOfficeModel(this.name, this.code, this._id, {this.state});

  factory RTOfficeModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return RTOfficeModel(json['name'], json['code'], json['_id'], state:json['state']);
    }catch(ex){
      print("RTOffice Model Exception ex : "+ex.toString());
      return null;
    }
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}