class User{
  String _name,username,_id,password;
  double _carsWon;


  User({this.username, this.password});

  double get carsWon => _carsWon;

  get id => _id;

  String get name => _name.toUpperCase();


  Map<String, dynamic> toJson() =>{
    'phone':username,
    'password':password,
  };

}