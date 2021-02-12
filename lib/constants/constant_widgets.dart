

import 'package:flutter/material.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/ui/pages/home_page.dart';

import 'app_font_style.dart';

Widget appBar(BuildContext context, String tittle){
  return AppBar(
    backgroundColor: APP_WHITE_COLOR,
    leading: IconButton(icon: Icon(Icons.arrow_back,color: APP_BLACK_COLOR,), onPressed: (){Navigator.pop(context);}),
    title: Text(tittle, style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),),
  );
}


