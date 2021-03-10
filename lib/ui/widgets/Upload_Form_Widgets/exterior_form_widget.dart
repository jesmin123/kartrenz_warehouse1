import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/ExteriorTyresModel.dart';
import 'package:kartenz/provider/electrical_form_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';
import 'documents_form_widget.dart';

class ExteriorFormWidget extends StatefulWidget {
  @override
  _ExteriorFormWidgetState createState() => _ExteriorFormWidgetState();
}

class _ExteriorFormWidgetState extends State<ExteriorFormWidget> {
  TextEditingController _roofController = TextEditingController(text: "yes");
  TextEditingController _bonnetController = TextEditingController(text: "yes");
  TextEditingController _dickyDoortController = TextEditingController(text: "yes");
  TextEditingController _quarterLHSController = TextEditingController(text: "yes");
  TextEditingController _quarterRHSController = TextEditingController(text: "yes");
  TextEditingController _fenderLHSController = TextEditingController(text: "yes");
  TextEditingController _fenderRHSController = TextEditingController(text: "yes");
  TextEditingController _pillarController = TextEditingController(text: "yes");
  TextEditingController _apronController = TextEditingController(text: "yes");
  TextEditingController _firewallController = TextEditingController(text: "yes");
  TextEditingController _cowlTopController = TextEditingController(text: "yes");
  TextEditingController _upperCrossController = TextEditingController(text: "yes");
  TextEditingController _lowerCrossController = TextEditingController(text: "yes");
  TextEditingController _radiatorController = TextEditingController(text: "yes");
  TextEditingController _runningLHSController = TextEditingController(text: "yes");
  TextEditingController _runningRHSController = TextEditingController(text: "yes");
  TextEditingController _doorRHSFrontController = TextEditingController(text: "yes");
  TextEditingController _doorRHSRearController = TextEditingController(text: "yes");
  TextEditingController _doorLHSFrontController = TextEditingController(text: "yes");
  TextEditingController _doorLHSRearController = TextEditingController(text: "yes");
  TextEditingController _bumperRearController = TextEditingController(text: "yes");
  TextEditingController _bumperFrontController = TextEditingController(text: "yes");
  TextEditingController _windShieldFrontController = TextEditingController(text: "yes");
  TextEditingController _windShieldRearController = TextEditingController(text: "yes");
  TextEditingController _lhsFogController = TextEditingController(text: "yes");
  TextEditingController _rhsFogController = TextEditingController(text: "yes");
  TextEditingController _lhsHeadlightController = TextEditingController(text: "yes");
  TextEditingController _lhsTailightController = TextEditingController(text: "yes");
  TextEditingController _rhsHeadlightController = TextEditingController(text: "yes");
  TextEditingController _rhsTaillightController = TextEditingController(text: "yes");
  TextEditingController _orvmRHSController = TextEditingController(text: "yes");
  TextEditingController _orvmLHSController = TextEditingController(text: "yes");
  TextEditingController _alloyWheelController = TextEditingController(text: "yes");
  TextEditingController _lhsFrontTyreController = TextEditingController();
  TextEditingController _rhsFrontTyreController = TextEditingController();
  TextEditingController _lhsrearTyreController = TextEditingController();
  TextEditingController _rhsRearTyreController = TextEditingController();
  TextEditingController _spareTyreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ElectricalFormProvider electricalFormProvider = Provider.of(context);
    FormData formData = Provider.of(context);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          radioRow(tittle: "Roof", groupValue: "Roof", key: "Roof", controller: _roofController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Bonnet / Hood", groupValue: "Bonnet", key: "Bonnet", controller: _bonnetController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Dicky Door / Boot Door", groupValue: "Dicky Door", key: "Dicky Door", controller: _dickyDoortController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Quarter Panel', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 8,),
          radioRow(tittle: "LHS", groupValue: "Quarter LHS", key: "Quarter LHS", controller: _quarterLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS", groupValue: "Quarter RHS", key: "Quarter RHS", controller: _quarterRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Fender', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "LHS", groupValue: "Fender LHS", key: "Fender LHS", controller: _fenderLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS", groupValue: "Fender RHS", key: "Fender RHS", controller: _fenderRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Pillar", groupValue: "Pillar", key: "Pillar", controller: _pillarController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Apron", groupValue: "Apron", key: "Apron", controller: _apronController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Firewall", groupValue: "Firewall", key: "Firewall", controller: _firewallController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "CowlTop", groupValue: "CowlTop", key: "CowlTop", controller: _cowlTopController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Upper Cross Member", groupValue: "Upper Cross", key: "Upper Cross", controller: _upperCrossController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Lower Cross Member", groupValue: "Lower Cross", key: "Lower Cross", controller: _lowerCrossController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Radiator Support", groupValue: "Radiator", key: "Radiator", controller: _radiatorController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Running Border', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "LHS", groupValue: "Running LHS", key: "Running LHS", controller: _runningLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS", groupValue: "Running RHS", key: "Running RHS", controller: _runningRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Door', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "RHS Front", groupValue: "RHS Front", key: "RHS Front", controller: _doorRHSFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS Rear", groupValue: "RHS Rear", key: "RHS Rear", controller: _doorRHSRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "LHS Front", groupValue: "LHS Front", key: "LHS Front", controller: _doorLHSFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "LHS Rear", groupValue: "LHS Rear", key: "LHS Rear", controller: _doorLHSRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Bumper', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "Front", groupValue: "Bumper Front", key: "Bumper Front", controller: _bumperFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Rear", groupValue: "Bumper Rear", key: "Bumper Rear", controller: _bumperRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Wind Shield', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "Front", groupValue: "Wind Shield Front", key: "Wind Shield Front", controller: _windShieldFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Rear", groupValue: "Wind Shield Rear", key: "Wind Shield Rear", controller: _windShieldRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Light', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "LHS Fog Light", groupValue: "LHS Fog", key: "LHS Fog", controller: _lhsFogController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS Fog Light", groupValue: "RHS Fog", key: "RHS Fog", controller: _rhsFogController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "LHS Headlight", groupValue: "LHS Headlight", key: "LHS Headlight", controller: _lhsHeadlightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "LHS Taillight", groupValue: "LHS Taillight", key: "LHS Taillight", controller: _lhsTailightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS Headlight", groupValue: "RHS Headlight", key: "RHS Headlight", controller: _rhsHeadlightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS Taillight", groupValue: "RHS Taillight", key: "RHS Taillight", controller: _rhsTaillightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('ORVM - Manual / Electrical', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(tittle: "LHS", groupValue: "ORVM LHS", key: "ORVM LHS", controller: _orvmLHSController, text: "NA", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "RHS", groupValue: "ORVM RHS", key: "ORVM RHS", controller: _orvmRHSController, text: "NA", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(tittle: "Alloy Wheels", groupValue: "Alloy Wheels", key: "Alloy Wheels", controller: _alloyWheelController, text: "No", electricalFormProvider: electricalFormProvider,
          na: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                activeColor: PRIMARY_COLOR,
                value: "n/a",
                groupValue: electricalFormProvider.exteriorRadioItem["Alloy Wheels"],
                onChanged: (val) =>
                    electricalFormProvider.updateExteriorradioItem("Alloy Wheels", val),
              ),
              Text(
                "N/A",
                style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
              )
            ],
          ),
          ),
          SizedBox(height: 24,),
          Text('Tyre', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          tyreWidget(context, _lhsFrontTyreController, "LHS Front Tyre", electricalFormProvider, "LHS Front Tyre"),
          SizedBox(height: 12,),
          tyreWidget(context, _rhsFrontTyreController, "RHS Front Tyre", electricalFormProvider, "RHS Front Tyre"),
          SizedBox(height: 12,),
          tyreWidget(context, _lhsrearTyreController, "LHS Rear Tyre", electricalFormProvider, "LHS Rear Tyre"),
          SizedBox(height: 12,),
          tyreWidget(context, _rhsRearTyreController, "RHS Rear Tyre", electricalFormProvider, "RHS Rear Tyre"),
          SizedBox(height: 12,),
          tyreWidget(context, _spareTyreController, "Spare Tyre", electricalFormProvider, "Spare Tyre"),
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
              electricalFormProvider.exteriorRating = rating;
            },
          ),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: RaisedButton(
              onPressed:(){
                formData.activeStep=6;
                formData.stepCount=6;
              },
              child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: PRIMARY_COLOR,

            ),
          )

    ]
    )
    );
}

Map exteriorDataMap = {};

saveValue(String key,String value){
    if(exteriorDataMap.containsKey(key)){
      exteriorDataMap[key] = value;
    }else{
      exteriorDataMap.putIfAbsent(key, () => value);
    }
    ExteriorTyresModel exteriorTyresModel = ExteriorTyresModel.fromJSON(exteriorDataMap);
    if(exteriorTyresModel!=null){
      FormData formData = Provider.of(context,listen: false);
      formData.uploadCar.exteriorTyresModel = exteriorTyresModel;
    }
}


radioRow(
    {String tittle,
      ElectricalFormProvider electricalFormProvider,
      String groupValue,
      TextEditingController controller, String key, String text, Widget na}) {
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
                  groupValue: electricalFormProvider.exteriorRadioItem[groupValue],
                  onChanged: (val){
                    saveValue(key, "No");
                    electricalFormProvider.updateExteriorradioItem(groupValue, val);
                  }
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
                  groupValue: electricalFormProvider.exteriorRadioItem[groupValue],
                  onChanged: (val){
                    if(val=="No"){
                        saveValue(key, "No");
                    }
                    electricalFormProvider.updateExteriorradioItem(groupValue, val);
                  }

                ),
                Text(
                  text,
                  style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
                )
              ],
            ),
            na!=null?na:Container(),
          ],
        ),
      ),
      electricalFormProvider.exteriorRadioItem[groupValue] == "yes"
          ? Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: TextFormField(
                  decoration: decoration(),
                  controller: controller,
                  onChanged: (val){
                    saveValue(key, val);
                  },
                ),
              ),
              Flexible(
                child: RaisedButton(
                  onPressed: () {
                    showBottom(context, () async {
                      Navigator.pop(context);
                      PickedFile result = await pickCameraImages();
                      if(result!=null){
                        electricalFormProvider.updateExteriorImage(key, PlatformFile(path: result.path));
                      }
                    }, (){
                      Navigator.pop(context);
                        pickImages().then((filePickerResult){
                        if(filePickerResult!=null){
                        electricalFormProvider.updateExteriorImage(key, filePickerResult.files.first);
                    }});
                      },);},
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
          electricalFormProvider.exteriorImage[key]!=null?Column(
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.file(File(electricalFormProvider.exteriorImage[key].path),
                  )
              ),
              FlatButton(onPressed: (){
                electricalFormProvider.removeFromExteriorImage(key);
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

Future<FilePickerResult> pickImages() async {
  List<String> extensions = ['jpg', 'png', 'jpeg'];
  FilePickerResult result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: extensions,
  );
  if (result != null) {
    return result;
  } else {
    return null;
  }
}
}


tyreWidget(BuildContext context,TextEditingController controller, String label, ElectricalFormProvider electricalFormProvider, String key){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR),
                  ),
                ),
              )
          ),
          Flexible(
            flex: 1,
              child: FlatButton(
                minWidth: 24,
                height: 24,
                child: Icon(Icons.add, color: PRIMARY_COLOR, size: 16,),
                onPressed: (){
                showBottom(context, () async {
                  Navigator.pop(context);
                  PickedFile result = await pickCameraImages();
                  if(result!=null){
                    electricalFormProvider.updateTyreImage(key, PlatformFile(path: result.path));
                  }
                }, () async {
                  Navigator.pop(context);
                  FilePickerResult result = await pickImages();
                  electricalFormProvider.updateTyreImage(key, result.files.first);
                });
              },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: PRIMARY_COLOR)),
              )
          )
        ],
      ),
      SizedBox(height: 8,),
      electricalFormProvider.tyreImage[key]!=null?Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.file(File(electricalFormProvider.tyreImage[key].path),
          )
          ),
          FlatButton(onPressed: (){
            electricalFormProvider.removeFromTyreImage(key);
          }, child: Row(children: [
            Text("Delete", style: AppFontStyle.headingTextStyle2(APP_RED_COLOR),),
            Icon(Icons.delete, color: APP_RED_COLOR,)
          ],))
        ],
      ):Container()
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
