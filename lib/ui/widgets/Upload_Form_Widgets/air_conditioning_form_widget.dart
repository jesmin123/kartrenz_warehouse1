import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class AirConditionFormWidget extends StatefulWidget {
  @override
  _AirConditionFormWidgetState createState() => _AirConditionFormWidgetState();
}

class _AirConditionFormWidgetState extends State<AirConditionFormWidget> {
  TextEditingController _acCoolingController = TextEditingController(text: "yes");
  TextEditingController _heaterController = TextEditingController(text: "yes");
  TextEditingController _climateController = TextEditingController(text: "yes");
  TextEditingController _blowerController = TextEditingController(text: "yes");


  @override
  Widget build(BuildContext context) {
    BasicProvider basicProvider = Provider.of(context);
    FormData formData = Provider.of(context);
    return Form(
      child: Column(
        children: [
          radioRow(tittle: "AC Cooling", basicProvider: basicProvider, groupValue: "AC Cooling", controller: _acCoolingController, key: "AC Cooling"),
          SizedBox(height: 24,),
          radioRow(tittle: "Heater", basicProvider: basicProvider, groupValue: "Heater", controller: _heaterController, key: "Heater"),
          SizedBox(height: 24,),
          radioRow(tittle: "Climate Automatic Control AC", basicProvider: basicProvider, groupValue: "Climate", controller: _climateController, key: "Climate"),
          SizedBox(height: 24,),
          radioRow(tittle: "Blower Motor Noise", basicProvider: basicProvider, groupValue: "Blower", controller: _blowerController, key: "Blower"),
          SizedBox(height: 32,),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: PRIMARY_COLOR,
            ),
            onRatingUpdate: (rating) {
              print(rating);
             basicProvider.airConditionRating = rating;
            },
          ),
          SizedBox(height: 24,),
          RaisedButton(
            onPressed:(){
              formData.activeStep=4;
              formData.stepCount=4;
            },
            child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: PRIMARY_COLOR,

          ),
        ],
      ),
    );
  }
}

 radioRow(
    {String tittle,
    BasicProvider basicProvider,
    String groupValue,
    TextEditingController controller, String key}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: PRIMARY_COLOR,
                  value: "yes",
                  groupValue: basicProvider.radioItem[groupValue],
                  onChanged: (val) =>
                      basicProvider.updateRadioItem(groupValue, val),
                ),
                Text(
                  "yes",
                  style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: PRIMARY_COLOR,
                  value: "No",
                  groupValue: basicProvider.radioItem[groupValue],
                  onChanged: (val) =>
                      basicProvider.updateRadioItem(groupValue, val),
                ),
                Text(
                  "no",
                  style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: PRIMARY_COLOR,
                  value: "n/a",
                  groupValue: basicProvider.radioItem[groupValue],
                  onChanged: (val) =>
                      basicProvider.updateRadioItem(groupValue, val),
                ),
                Text(
                  "N/A",
                  style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
                )
              ],
            ),
          ],
        ),
      ),
      basicProvider.radioItem[groupValue] == "yes"
          ? Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: decoration(),
                        controller: controller,
                      ),
                    ),
                    Flexible(
                      child: RaisedButton(
                        onPressed: () {
                          pickImages().then((filePickerResult){
                            if(filePickerResult!=null){
                             basicProvider.updateImage(key, filePickerResult.files.first);
                            }
                          });
                        },
                        color: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Upload",
                          style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 12,),
              basicProvider.images[key]!=null?Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.file(File(basicProvider.images[key].path),
                  )
                  ),
                  FlatButton(onPressed: (){
                    basicProvider.removeImage(key);
                  }, child: Row(children: [
                    Text("Delete", style: AppFontStyle.headingTextStyle2(APP_RED_COLOR),),
                    Icon(Icons.delete, color: APP_RED_COLOR,)
                  ],))
                ],
              ):Container()
            ],
          )
          : Container()
    ],
  );
}

InputDecoration decoration() {
  return InputDecoration(
    labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PRIMARY_COLOR),
    ),
  );
}

Future<FilePickerResult> pickImages() async {
  List<String> extensions =  ['jpg', 'png', 'jpeg'];
  FilePickerResult result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: extensions,
  );
  if(result!=null){
    return result;
  }else{
    return null;
  }
}