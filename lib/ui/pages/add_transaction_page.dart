import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  bool value = false;
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of(context);
    return Scaffold(
        appBar: appBar(context, "Add New Transaction"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    SizedBox(height: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add New Transaction", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR,textSize: 22.0),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Note: Transaction id will be the reference id on broker payment screen.", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter transaction ID",
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
                              onPressed: (){
                                value = true;
                              },
                              child: Text("Submit", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR, textSize: 18.0),),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              color: PRIMARY_COLOR,
                            )
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: "Buy now", groupValue: formData.radioList, onChanged:(val)=>formData.radioList = val, activeColor: PRIMARY_COLOR,),
                        Text("Buy now", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                        Radio(value: "Auction", groupValue: formData.radioList, onChanged:(val)=>formData.radioList = val, activeColor: PRIMARY_COLOR),
                        Text("Auction", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                    SizedBox(height: 16,),
                    Divider(thickness: 1,),
                    value?Column(
                      children: [
                        SizedBox(height: 16,),
                        rowWidget("Transaction Id :", "10kCd9RZZ"),
                        SizedBox(height: 6,),
                        rowWidget("Broker Name :", "illyas"),
                        SizedBox(height: 6,),
                        rowWidget("Phone :", "7034066774"),
                        SizedBox(height: 6,),
                        rowWidget("Amount :", "Rs 600000"),
                        SizedBox(height: 6,),
                        rowWidget("Status :", "Paid"),
                        SizedBox(height: 12,),
                        RaisedButton(
                          onPressed: (){
                          },
                          child: Text("Proceed", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR, textSize: 18.0),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          color: PRIMARY_COLOR,
                        )
                      ],
                    ):Container()


                  ]
              ),
            ),
          ),
        )
    );
  }
}

Widget rowWidget(String tittle1, String tittle2){
  return Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Text("${tittle1}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
      ),
      Flexible(
        child: Text("${tittle2}", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
      )
    ],
  ),);
}
