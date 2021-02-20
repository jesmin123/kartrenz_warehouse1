
class NotificationModel{
  String title;
  String body;
  String date;
  String time;
  String id;

  NotificationModel(this.title, this.body, this.date, this.time,{this.id});

  Map<String, dynamic> toMap()=>{
    'id':id,
    'title':title,
    'body':body,
    'date':date,
    'time':time
  };

  factory NotificationModel.fromJSON(Map <String,dynamic> json){
    try{
      return NotificationModel(json['title'], json['body'], json['date'], json['time'],id: json['id']);
    }catch(e){
      print("Notification Mdoel Exception E: "+e.toString());
    }
    return null;
  }


}