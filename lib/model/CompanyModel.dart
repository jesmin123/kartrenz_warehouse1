class Company{
  String id;
  String name;
  String createdon;

  Company({this.id,this.name, this.createdon});

  factory Company.fromJSON(Map<dynamic, dynamic> json){
    try{
      return Company(id:json['_id'],name: json['name'],createdon: json['createdon']);
    }catch(e){
      print("Comapny Exception e: "+e.toString());
      return null;
    }
  }

  Map<String,dynamic> toJSON() =>{
    '_id':id,
  };
}