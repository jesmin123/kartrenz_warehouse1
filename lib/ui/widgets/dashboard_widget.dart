import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';

class DashboardWidget extends StatefulWidget {
  Color primary;
  String tittle;
  String value;

  DashboardWidget(this.primary, this.tittle, this.value);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: widget.primary,
        elevation: 2,
        child: Container(
          width: 160,
          height: 180,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text(widget.tittle, style: AppFontStyle.ultraTextStyle2(APP_WHITE_COLOR, textSize: 20.0),),
                SizedBox(height: 24,),
                Text(widget.value, style: AppFontStyle.ultraTextStyle2(APP_WHITE_COLOR, textSize: 58.0),)
              ],
            ),
          ),
        ));
  }
}
