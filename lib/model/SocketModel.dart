class SocketModel{
  bool status;
  bool heartbeat;
  dynamic data;
  String id;
  String token;
  String msg;

  SocketModel({this.status, this.heartbeat, this.data, this.id, this.token,this.msg});

  factory SocketModel.fromJSON(Map<dynamic, dynamic> json){
    try{
      return SocketModel(status: json['status'],heartbeat: json['heartbeat'],msg: json['msg'],id: json['id'],data: json['data'],token:json['token']);
    }catch(e){
      print("Exception e:"+e.toString());
      return SocketModel(status: false,msg: "Error in Socket");
    }
  }

}