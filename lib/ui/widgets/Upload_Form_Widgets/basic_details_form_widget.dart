import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'file:///F:/AndroidStudioProjects/kartenz/lib/model/Upload_Model/Upload_Model.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';



class BasicDetailsForm extends StatefulWidget {

  @override
  _BasicDetailsFormState createState() => _BasicDetailsFormState();
}

class _BasicDetailsFormState extends State<BasicDetailsForm> {




  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of<FormData>(context);
    CarWarehouseModel1 cars = formData.selectedCars;
    TextEditingController _variantController = TextEditingController(text: cars!=null?cars.variant:" ",);
    TextEditingController _kmsController = TextEditingController(text: cars!=null?cars.kilometers:"");
    TextEditingController _yearOfManufactureController = TextEditingController(text: cars!=null?cars.year:"");
    TextEditingController _basePriceController = TextEditingController(text: cars!=null?cars.basePrice:"");
    TextEditingController _expectedPriceController = TextEditingController();
    TextEditingController _regNoController = TextEditingController(text: cars!=null?cars.regNo:"");
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _supportNoController = TextEditingController(text: cars!=null?cars.supportNo:"");
    TextEditingController _highlightController = TextEditingController(text: cars!=null?cars.highlights:"");
    TextEditingController _mainImageController = TextEditingController();
    TextEditingController _inImageController = TextEditingController();
    TextEditingController _exImageController = TextEditingController();
    AuctionProvider auctionProvider = Provider.of(context);
    AuthProvider authProvider = Provider.of(context);
    return Container(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(

                items:  formData.company.map((e) {
                  return DropdownMenuItem(child: (Text(e.name)), value: e.id,);
                }).toList(),
                onChanged: (newValue) {
                formData.dropdownValue2 = newValue;
                formData.selectedCarMakeId = newValue;
                },

              decoration: InputDecoration(
                labelText: "Car make",
                labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR)
              ),
            ),
            SizedBox(height: 12,),
            DropdownButtonFormField(

              items: formData.sortedCarModel!=null?formData.sortedCarModel.map((e){
                return DropdownMenuItem(child: (Text(e.name)), value: e.id);
              }).toList():[DropdownMenuItem(child: (Text("")), value: "")],
              onChanged: (String newValue) {
                formData.dropdownValue = newValue;
              },
              
              decoration: InputDecoration(
                  labelText: "Car model",
                  labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR)
              ),
            ),
            SizedBox(height: 20,),
            Text("Fuel :", style: AppFontStyle.titleAppBarStyle2(APP_BLACK_COLOR),),
            SizedBox(height: 8,),
            Column(
              children: [
                Wrap(
                  children: [
                   radioWidget(formData, "petrol", "Petrol"),
                    radioWidget(formData, "Diseal", "Diseal"),
                    radioWidget(formData, "CNG", "CNG"),
                    radioWidget(formData, "Electric", "Electric"),
                    radioWidget(formData, "LPG", "LPG"),
                    radioWidget(formData, "Hybrid ", "Hybrid "),

                ],)
              ],
            ),
            TextFormField(
              decoration: decoration("Variant"),
              controller: _variantController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Kms"),
              controller: _kmsController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Year of manufacture"),
              controller: _yearOfManufactureController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Base price "),
              controller: _basePriceController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Expected price "),
              controller: _expectedPriceController,
            ),
            SizedBox(height: 12,),
            DropdownButtonFormField(
              value: formData.stateDropdown,
              items:  auctionProvider.stateList!=null?auctionProvider.stateList.map((e) {
                return DropdownMenuItem(value: e.id, child: (Text(e.name)));
              }).toList():[DropdownMenuItem(child: (Text("")), value: "") ],
              onChanged: (String newValue) {
                formData.stateDropdown = newValue;
                auctionProvider.setSelectedStateId(newValue, authProvider.loginModel.token);
              },
              decoration: InputDecoration(

                  labelText: "State",
                  labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR)
              ),
            ),
            SizedBox(height: 12,),
            DropdownButtonFormField(
              items:  auctionProvider.listRtOffice!=null?auctionProvider.listRtOffice.map((e){
                return DropdownMenuItem(child: (Text(e.name)), value: e.id,);
              }).toList():[DropdownMenuItem(child: (Text("")), value: "")],
              onChanged: (String newValue) {
                formData.rtOfficeDropdown = newValue;
              },
              decoration: InputDecoration(

                  labelText: "RT office",
                  labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR)
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Reg no"),
              controller: _regNoController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Description"),
              controller: _descriptionController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Support number"),
              controller: _supportNoController,
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: decoration("Highlight feature "),
                    controller: _highlightController,
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: RaisedButton(
                      onPressed: (){
                        formData.addToFeature(_highlightController.text);
                        _highlightController.text = "";
                      },
                      color: PRIMARY_COLOR,
                      child: Text('Add', style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR, textSize: 16.0),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 12,),
            Wrap(
                spacing: 8,
                children: formData.features.map((e) => Chip(
                  padding: EdgeInsets.all(4),
                  label: Text("${e}"),
                  deleteIcon: Icon(Icons.close, size: 22,),
                  onDeleted: (){formData.removeFromfeature(e);},)).toList()
            ),
            SizedBox(height: 12,),
            Text("Images", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Main Image :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      RaisedButton(
                        onPressed: (){
                          print("Entered");
                           pickImages(false).then((filePickerResult){
                            if(filePickerResult!=null){
                              formData.mainImage = filePickerResult.files.first;
                            }
                          });

                        },
                        color: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                      ),
                    ],
                  ),
                  formData.mainImage!=null? Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        child: Image.file(File(formData.mainImage.path)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: decoration("Description"),
                              controller: _mainImageController,
                            ),
                          ),
                          Flexible(
                              child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                                formData.mainImage = null;
                              },),
                          )
                        ],
                      ),
                    ],
                  ): Container(),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Interior Images :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      RaisedButton(
                        onPressed: () async {
                          FilePickerResult filePickerResult  = await pickImages(true);
                          if(filePickerResult!=null){
                            formData.addToInteriorImage(filePickerResult.files);
                          }
                        },
                        color: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                      ),
                    ],
                  ),
                  formData.interiorImage!=null?ListView.separated(
                      separatorBuilder: (context,_){
                        return SizedBox(height: 12,);
                      },
                    itemCount: formData.interiorImage.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_,pos){
                       return  Column(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              child: Image.file(File(formData.interiorImage[pos].path)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    decoration: decoration("Description"),
                                    controller: _inImageController,
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                                    formData.removeFromInteriorImage(pos);
                                  },),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ): Container(),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exterior Images :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      RaisedButton(
                        onPressed: () async {
                          FilePickerResult filePickerResult  = await pickImages(true);
                          if(filePickerResult!=null){
                            formData.addToExteriorImage(filePickerResult.files);
                          }
                        },
                        color: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                      ),
                    ],
                  ),
                  formData.exteriorImage!=null?ListView.separated(
                      separatorBuilder: (context,_){
                        return SizedBox(height: 12,);
                      },
                      itemCount: formData.exteriorImage.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_,pos){
                        return  Column(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              child: Image.file(File(formData.exteriorImage[pos].path)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    decoration: decoration("Description"),
                                    controller: _exImageController,
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                                    formData.removeFromExteriorImage(pos);
                                  },),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ): Container(
                  )

                ],
              ), 
            ),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: RaisedButton(
                onPressed:(){

                  CustomerDetails customerDetails = new CustomerDetails(
                    yearOfManufacture: _yearOfManufactureController.text, supportNumber: _supportNoController.text,regNo: _regNoController.text,
                    rtOffice: formData.rtOfficeDropdown, kms: _kmsController.text, highlightFeature: formData.features, fuel: formData.radioItem,
                    expectedPrice: _expectedPriceController.text, description: _descriptionController.text, basePrice: _basePriceController.text,
                    state: formData.stateDropdown, carMake: formData.dropdownValue, carModel: formData.dropdownValue2, variant: _variantController.text
                  );
                  jsonEncode(customerDetails);
                  formData.activeStep=1;
                  formData.stepCount=1;
                },
                child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: PRIMARY_COLOR,

              ),
            )



          ],
        ),
      ),
    );
  }

  Future<FilePickerResult> pickImages(bool allowMutiple) async {
    List<String> extensions =  ['jpg', 'png', 'jpeg'];
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: allowMutiple,
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if(result!=null){
      //TODO implement multiple files logic
      if(extensions.contains(result.files.first.extension)){
        return result;
      }else{
        return null;
      }
    }else{
     return null;
    }
  }

}

InputDecoration decoration(String label){
  return InputDecoration(

    labelText: label,
    labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PRIMARY_COLOR),
    ),
  );
}

Widget radioWidget(FormData formData, String value, String tittle){
  return  Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Radio(
        activeColor: PRIMARY_COLOR ,
        value: value,
        groupValue: formData.radioItem,
        onChanged: (val)=> formData.radioItem = val,
      ),
      Text(tittle, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
    ],
  );




}