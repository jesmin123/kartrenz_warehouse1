import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/ExteriorTyresModel.dart';
import 'package:kartenz/provider/basic_providers.dart';
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
    BasicProvider basicProvider = Provider.of(context);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          radioRow(basicProvider, tittle: "Roof", groupValue: "Roof", key: "Roof", controller: _roofController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Bonnet / Hood", groupValue: "Bonnet", key: "BonnetorHood", controller: _bonnetController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Dicky Door / Boot Door", groupValue: "Dicky Door", key: "DickyDoororBootDoor", controller: _dickyDoortController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Quarter Panel', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 8,),
          radioRow(basicProvider, tittle: "LHS", groupValue: "Quarter LHS", key: "QuarterPanelLHS", controller: _quarterLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS", groupValue: "Quarter RHS", key: "QuarterPanelRHS", controller: _quarterRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Fender', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "LHS", groupValue: "Fender LHS", key: "FenderLHS", controller: _fenderLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS", groupValue: "Fender RHS", key: "FenderRHS", controller: _fenderRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Pillar", groupValue: "Pillar", key: "Pillar", controller: _pillarController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Apron", groupValue: "Apron", key: "Apron", controller: _apronController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Firewall", groupValue: "Firewall", key: "Firewall", controller: _firewallController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "CowlTop", groupValue: "CowlTop", key: "CowlTop", controller: _cowlTopController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Upper Cross Member", groupValue: "Upper Cross", key: "UpperCrossMember", controller: _upperCrossController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Lower Cross Member", groupValue: "Lower Cross", key: "LowerCrossMember", controller: _lowerCrossController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Radiator Support", groupValue: "Radiator", key: "RadiatorSupport", controller: _radiatorController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Running Border', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "LHS", groupValue: "Running LHS", key: "RunningBorderLHS", controller: _runningLHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS", groupValue: "Running RHS", key: "RunningBorderRHS", controller: _runningRHSController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Door', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "RHS Front", groupValue: "RHS Front", key: "DoorRHSFront", controller: _doorRHSFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS Rear", groupValue: "RHS Rear", key: "DoorRHSRear", controller: _doorRHSRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "LHS Front", groupValue: "LHS Front", key: "DoorLHSFront", controller: _doorLHSFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "LHS Rear", groupValue: "LHS Rear", key: "DoorLHSRear", controller: _doorLHSRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Bumper', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "Front", groupValue: "Bumper Front", key: "BumperFront", controller: _bumperFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Rear", groupValue: "Bumper Rear", key: "BumperRear", controller: _bumperRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Wind Shield', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "Front", groupValue: "Wind Shield Front", key: "WindshieldFront", controller: _windShieldFrontController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Rear", groupValue: "Wind Shield Rear", key: "WindshieldBack", controller: _windShieldRearController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('Light', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "LHS Fog Light", groupValue: "LHS Fog", key: "LHSFogLight", controller: _lhsFogController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS Fog Light", groupValue: "RHS Fog", key: "RHSFogLight", controller: _rhsFogController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "LHS Headlight", groupValue: "LHS Headlight", key: "LHSHeadlight", controller: _lhsHeadlightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "LHS Taillight", groupValue: "LHS Taillight", key: "LHSTaillight", controller: _lhsTailightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS Headlight", groupValue: "RHS Headlight", key: "RHSHeadlight", controller: _rhsHeadlightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS Taillight", groupValue: "RHS Taillight", key: "RHStaillight", controller: _rhsTaillightController, text: "No", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          Text('ORVM - Manual / Electrical', style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          SizedBox(height: 12,),
          radioRow(basicProvider, tittle: "LHS", groupValue: "ORVM LHS", key: "ORVMLHS", controller: _orvmLHSController, text: "NA", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "RHS", groupValue: "ORVM RHS", key: "ORVMRHS", controller: _orvmRHSController, text: "NA", electricalFormProvider: electricalFormProvider),
          SizedBox(height: 24,),
          radioRow(basicProvider, tittle: "Alloy Wheels", groupValue: "Alloy Wheels", key: "AlloyWheels", controller: _alloyWheelController, text: "No", electricalFormProvider: electricalFormProvider,
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
          tyreWidget(context, basicProvider, _lhsFrontTyreController, "LHS Front Tyre", electricalFormProvider, "LHSFrontTyre"),
          SizedBox(height: 12,),
          tyreWidget(context, basicProvider, _rhsFrontTyreController, "RHS Front Tyre", electricalFormProvider, "RHSFrontTyre"),
          SizedBox(height: 12,),
          tyreWidget(context, basicProvider, _lhsrearTyreController, "LHS Rear Tyre", electricalFormProvider, "LHSRearTyre"),
          SizedBox(height: 12,),
          tyreWidget(context, basicProvider, _rhsRearTyreController, "RHS Rear Tyre", electricalFormProvider, "RHSRearTyree"),
          SizedBox(height: 12,),
          tyreWidget(context, basicProvider, _spareTyreController, "Spare Tyre", electricalFormProvider, "SpareTyre"),
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
              formData.uploadCar.exteriorTyresModel.rating = rating.round();
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


radioRow(BasicProvider basicProvider,
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
                        basicProvider.addToimages(key,PlatformFile(path: result.path));
                      }
                    }, (){
                      Navigator.pop(context);
                        pickImages().then((filePickerResult){
                        if(filePickerResult!=null){
                        electricalFormProvider.updateExteriorImage(key, filePickerResult.files.first);
                        basicProvider.addToimages(key,filePickerResult.files.first);
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


tyreWidget(BuildContext context, BasicProvider basicProvider, TextEditingController controller, String label, ElectricalFormProvider electricalFormProvider, String key){
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
                    basicProvider.addToimages(key, PlatformFile(path: result.path));
                  }
                }, () async {
                  Navigator.pop(context);
                  FilePickerResult result = await pickImages();
                  electricalFormProvider.updateTyreImage(key, result.files.first);
                  basicProvider.addToimages(key, result.files.first);
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
