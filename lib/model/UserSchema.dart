import 'dart:io';

class UserSchema{
  String id;
  String username="";
  String password="";
  String name="";
  String phone="";
  String address0="";
  String address1="";
  String city="";
  String state="";
  String role="";
  String district="";
  String panno="";
  String gstno="";
  String msg="";
  String token="";
  String broker="";
  bool isverified;
  String status="";
  File profilepic;
  File pancard;
  File aadharFront;
  File aadharBack;
  int noofcarswon = 0;

  UserSchema({this.id,this.username, this.password, this.name, this.phone, this.address0,
    this.address1, this.city, this.state, this.role, this.isverified,
    this.status, this.profilepic, this.pancard, this.aadharFront,
    this.aadharBack,this.msg,this.token,this.broker,this.noofcarswon,this.district,this.panno,this.gstno}
      );

  factory UserSchema.fromJSON(Map<dynamic, dynamic> json){
    try{
      return UserSchema(
          id: json['_id'],
          username: json['username'],
          password:json['password'],
          name:json['name'],
          phone: json['phone'],
          address0:json['address0'],
          address1:json['address1'],
          city: json['city'],
          district: json['district'],
          panno: json['panno'],
          gstno: json['gstno'],
          state: json['state'],
          role: json['role'],
          isverified: json['isverified'],
          status: json['status'],
          msg: json['msg'],
          broker: json['broker'],
          noofcarswon: json['noofcarswon']
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }

  Map<String, dynamic> toJson() =>
      {
        'phone' : phone,
        'password':password,
        'broker': broker,
        'name':name,
        'username': username
      };

  void setId(String id){
    this.id = id;
  }
}