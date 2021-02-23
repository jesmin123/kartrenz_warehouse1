import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  FocusNode f1 = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Transaction"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transaction", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Your trasactions is listed below", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      )
                ],
              ),
                  RaisedButton(
                      onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Text("ADD", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR,textSize: 18.0),),
                    color: PRIMARY_COLOR,
                  )
            ],
          ),
              SizedBox(height: 12,),
              TextFormField(
                onTap:() async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime dt = await showMDatePicker();
                  _dateController.text = dt.toIso8601String().substring(0,10);
                },
                  controller: _dateController,
                decoration: InputDecoration(
                    hintText: "Select Date Range",
                    hintStyle: AppFontStyle.regularTextStyle2(APP_GREY_COLOR),
                    suffixIcon: Icon(Icons.calendar_today_outlined, color: APP_GREY_COLOR,),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    fillColor: Colors.grey[100],
                  filled: true
                )
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Select by transaction ID",
                              hintStyle: AppFontStyle.regularTextStyle2(APP_GREY_COLOR),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              fillColor: Colors.grey[100],
                              filled: true
                          )
                      ),
                  ),

                  Flexible(
                    flex: 1,
                      child: RaisedButton(
                        onPressed: (){},
                        child: Text("SEARCH", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR, textSize: 18.0),),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: PRIMARY_COLOR,
                      )
                  )
                ],
              ),



    ]
          ),
        ),
      )
    );
  }
  Future<DateTime> showMDatePicker() async {
    DateTime date = await showDatePicker(
        context: context,

        initialDate:DateTime.now(),
        firstDate:DateTime(1900),
        lastDate: DateTime(2100));

    return date!=null?date:DateTime.now();
  }
}

