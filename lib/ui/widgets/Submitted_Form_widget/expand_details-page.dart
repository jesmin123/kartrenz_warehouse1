import 'package:flutter/material.dart';
import 'package:kartenz/constants/constant_widgets.dart';

class ExpandDetailPage extends StatefulWidget {
  @override
  _ExpandDetailPageState createState() => _ExpandDetailPageState();
}

class _ExpandDetailPageState extends State<ExpandDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Cars"),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

Widget carDetails(String tittle1, String tittle2){
  return Column(
    children: [
      Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
      Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),)
    ],
  );
}