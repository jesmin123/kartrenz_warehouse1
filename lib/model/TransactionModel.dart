class Transaction{
  String date,amount;
  String lamount,lpaid,ltransactionID;
  bool completed;
  int tAmount;

  Transaction({this.tAmount,this.date,  this.lamount, this.lpaid,
    this.ltransactionID,this.amount,this.completed});

  getLtransactionID(){ return ltransactionID ;}

  getLpaid() {return lpaid; }

  String getLAmount() { return lamount; }

  getAmount(){ return amount; }

  String getDate() {return date; }

  factory Transaction.fromJSON(Map<dynamic,dynamic> json){
    return Transaction(tAmount: json['amount'],completed: json['completed']);
  }

}