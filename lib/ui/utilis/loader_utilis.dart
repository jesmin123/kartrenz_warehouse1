import 'package:flutter/material.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Loader{
  static ProgressDialog  getLoader(BuildContext context){
    ProgressDialog pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Wait...',
        borderRadius: 4.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(PRIMARY_COLOR),

        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 8.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Exo"),
        messageTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 19.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Exo"));
    return pr;
  }
}