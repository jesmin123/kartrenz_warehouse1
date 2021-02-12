import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';

class AdminContactTab extends StatefulWidget {
  @override
  _AdminContactTabState createState() => _AdminContactTabState();
}

class _AdminContactTabState extends State<AdminContactTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Text("Contact admin for technical assistance and other support services at:", textAlign: TextAlign.center, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR, textSize: 18.0),)
          ],
        ),
      ),
    );
  }
}
