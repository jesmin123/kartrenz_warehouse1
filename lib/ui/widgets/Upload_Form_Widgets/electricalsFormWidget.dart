import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/electrical_form_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class ElectricalsFormWidget extends StatefulWidget {
  @override
  _ElectricalsFormWidgetState createState() => _ElectricalsFormWidgetState();
}

class _ElectricalsFormWidgetState extends State<ElectricalsFormWidget> {
  TextEditingController _lhsFrontController = TextEditingController(text: "yes");
  TextEditingController _lhsRearController = TextEditingController(text: "yes");
  TextEditingController _rhsFrontController = TextEditingController(text: "yes");
  TextEditingController _rhsRearController = TextEditingController(text: "yes");
  TextEditingController _airbagFeatureController = TextEditingController(text: "yes");
  TextEditingController _musicSystemController = TextEditingController(text: "yes");
  TextEditingController _leatherSeatController = TextEditingController(text: "yes");
  TextEditingController _fabricSeatController = TextEditingController(text: "yes");
  TextEditingController _sunRoofController = TextEditingController(text: "yes");
  TextEditingController _steeringMountedController = TextEditingController(text: "yes");
  TextEditingController _absController = TextEditingController(text: "yes");
  TextEditingController _rearDefoggerController = TextEditingController(text: "yes");
  TextEditingController _reverseCameraController = TextEditingController(text: "yes");
  TextEditingController _electricalController = TextEditingController(text: "yes");
  TextEditingController _interiorController = TextEditingController(text: "yes");

  @override
  Widget build(BuildContext context) {
    ElectricalFormProvider electricalFormProvider = Provider.of(context);
    FormData formData = Provider.of(context);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          radioRow(key: "LHS Front", controller: _lhsFrontController, groupValue: "LHS Front", tittle: "LHS Front", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "LHS Rear", controller: _lhsFrontController, groupValue: "LHS Rear", tittle: "LHS Rear", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "RHS Front", controller: _lhsFrontController, groupValue: "RHS Front", tittle: "RHS Front", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "RHS Rear", controller: _lhsFrontController, groupValue: "RHS Rear", tittle: "RHS Rear", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Airbag Feature", controller: _lhsFrontController, groupValue: "Airbag Feature", tittle: "Airbag Feature", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Music System", controller: _lhsFrontController, groupValue: "Music System", tittle: "Music System", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Leather Seat", controller: _lhsFrontController, groupValue: "Leather Seat", tittle: "Leather Seat", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Fabric Seat", controller: _lhsFrontController, groupValue: "Fabric Seat", tittle: "Fabric Seat", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Sun Roof", controller: _lhsFrontController, groupValue: "Sun Roof", tittle: "Sun Roof", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Steering Mounted", controller: _lhsFrontController, groupValue: "Steering Mounted", tittle: "Steering MountedAudio Control", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "ABS", controller: _lhsFrontController, groupValue: "ABS", tittle: "ABS", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Rear Defogger", controller: _lhsFrontController, groupValue: "Rear Defogger", tittle: "Rear Defogger", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Reverse Camera", controller: _lhsFrontController, groupValue: "Reverse Camera", tittle: "Reverse Camera", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Electrical", controller: _lhsFrontController, groupValue: "Electrical", tittle: "Electrical", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(key: "Interior", controller: _lhsFrontController, groupValue: "Interior", tittle: "Interior", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Damages Images :", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
              RaisedButton(
                onPressed: () async {
                  print("Entered");
                  FilePickerResult filePickerResult =  await pickImages(false);
                  if(filePickerResult!=null){
                    electricalFormProvider.addToDamageImage(filePickerResult.files);
                  }
                },
                color: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
              ),
            ],
          ),
          SizedBox(height: 12,),
          electricalFormProvider.damageImage!=null?ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, pos){
                return Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.file(File(electricalFormProvider.damageImage[pos].path),
                    )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: TextFormField(
                            decoration: decoration(label: "Description"),
                          ),
                        ),
                        Flexible(
                          child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                           electricalFormProvider.removeFromDamageImage(pos);
                          },),
                        )
                      ],
                    ),

                  ],
                );
              },
              separatorBuilder: (context, pos){
                return SizedBox(
                  height: 8,
                );
              },
              itemCount: electricalFormProvider.damageImage.length
          ):Container(),
          SizedBox(height: 24,),
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
              electricalFormProvider.electricalRating = rating;
            },
          ),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: RaisedButton(
              onPressed:(){
                formData.activeStep=5;
                formData.stepCount=5;
              },
              child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: PRIMARY_COLOR,

            ),
          )



        ],

      ),
    );
  }
}

radioRow(
    {String tittle,
      ElectricalFormProvider electricalFormProvider,
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
                  groupValue: electricalFormProvider.radioItems[groupValue],
                  onChanged: (val) =>
                      electricalFormProvider.updateRadioItems(groupValue, val),
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
                  groupValue: electricalFormProvider.radioItems[groupValue],
                  onChanged: (val) =>
                      electricalFormProvider.updateRadioItems(groupValue, val),
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
                  groupValue: electricalFormProvider.radioItems[groupValue],
                  onChanged: (val) =>
                      electricalFormProvider.updateRadioItems(groupValue, val),
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
      electricalFormProvider.radioItems[groupValue] == "yes"
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
                    pickImages(false).then((filePickerResult){
                      if(filePickerResult!=null){
                        electricalFormProvider.updateImage(key, filePickerResult.files.first);
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
         electricalFormProvider.electricalImages[key]!=null?Column(
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.file(File(electricalFormProvider.electricalImages[key].path),
                  )
              ),
              FlatButton(onPressed: (){
                electricalFormProvider.removeFromImage(key);
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

InputDecoration decoration({String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PRIMARY_COLOR),
    ),
  );
}

Future<FilePickerResult> pickImages(bool allowMultiple) async {
  List<String> extensions = ['jpg', 'png', 'jpeg'];
  FilePickerResult result = await FilePicker.platform.pickFiles(
    allowMultiple: allowMultiple,
    type: FileType.custom,
    allowedExtensions: extensions,
  );
  if (result != null) {
    return result;
  } else {
    return null;
  }
}
