import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/AieConditioningModel.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

import 'documents_form_widget.dart';

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
          radioRow(context, tittle: "AC Cooling", basicProvider: basicProvider, groupValue: "AC Cooling", controller: _acCoolingController, key: "ACCooling"),
          SizedBox(height: 24,),
          radioRow(context, tittle: "Heater", basicProvider: basicProvider, groupValue: "Heater", controller: _heaterController, key: "Heater"),
          SizedBox(height: 24,),
          radioRow(context, tittle: "Climate Automatic Control AC", basicProvider: basicProvider, groupValue: "Climate", controller: _climateController, key: "ClimateChangeControlAC"),
          SizedBox(height: 24,),
          radioRow(context, tittle: "Blower Motor Noise", basicProvider: basicProvider, groupValue: "Blower", controller: _blowerController, key: "BlowerMotorNoise"),
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
              formData.uploadCar.acModel.rating = rating.round();
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

        Map acDataMap = {};

        saveValue(String key,String value){
          if(acDataMap.containsKey(key)){
            acDataMap[key] = value;
          }else{
            acDataMap.putIfAbsent(key, () => value);
          }
          ACModel acModel = ACModel.fromJSON(acDataMap);
          if(acModel!=null){
            FormData formData = Provider.of(context,listen: false);
            formData.uploadCar.acModel = acModel;
          }
        }

         radioRow(BuildContext context,
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
                                  showBottom(context, () async {
                                    Navigator.pop(context);
                                    PickedFile result = await pickCameraImages();
                                    if (result != null) {
                                      basicProvider.updateImage(key, PlatformFile(
                                          path: result.path));
                                      basicProvider.addToimages(key,PlatformFile(path: result.path));
                                    }
                                  }, (){
                                    Navigator.pop(context);
                                    pickImages().then((filePickerResult){
                                      if(filePickerResult!=null){
                                        basicProvider.updateImage(key, filePickerResult.files.first);
                                        basicProvider.addToimages(key,filePickerResult.files.first);
                                      }
                                    });
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

        Widget showBottom(BuildContext context, Function() ontap, Function() ontap2){
          showModalBottomSheet(
              context: context,
              builder: (builder){
                return Container(
                  decoration: BoxDecoration(borderRadius:
                  BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
                  height: 160,
                  child: Column(
                    children: [
                      SizedBox(height: 8,),
                      Text("Choose an action", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      SizedBox(height: 22,),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: ontap,
                              child: Column(
                                children: [
                                  Image.asset("assets/images/camera.png", width: 50, height: 50,),
                                  SizedBox(height: 8,),
                                  Text("Camera", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                                ],
                              ),
                            ),
                            SizedBox(width: 24,),
                            GestureDetector(
                              onTap: ontap2,
                              child: Column(
                                children: [
                                  Image.asset("assets/images/gallery1.png", width: 50, height: 50,),
                                  SizedBox(height: 8,),
                                  Text("Gallery", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                );
              }
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
}