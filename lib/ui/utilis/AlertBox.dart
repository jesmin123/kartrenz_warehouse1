import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartenz/constants/colors.dart';

class AlertBox{
  static showToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: PRIMARY_COLOR,
      textColor: Colors.white,
      fontSize: 16.0,

    );
  }

}