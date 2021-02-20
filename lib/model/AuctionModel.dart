class AuctionModel{
  int highestBid;
  String leaderId;
  dynamic time;

  AuctionModel({this.highestBid, this.leaderId, this.time});

  factory AuctionModel.formJSON(Map<dynamic, dynamic> json){
    try {
      return AuctionModel(highestBid: json['value'],
          leaderId: json['participant'],
          time: json['time']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}