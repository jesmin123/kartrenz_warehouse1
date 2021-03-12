import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/Upload_Model/Upload_car_model.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';



class BasicDetailsForm extends StatefulWidget {

  @override
  _BasicDetailsFormState createState() => _BasicDetailsFormState();
}

class _BasicDetailsFormState extends State<BasicDetailsForm> {

  _BasicDetailsFormState(){

  }

  TextEditingController _variantController = TextEditingController();
  TextEditingController _kmsController = TextEditingController();
  TextEditingController _yearOfManufactureController = TextEditingController();
  TextEditingController _basePriceController = TextEditingController();
  TextEditingController _expectedPriceController = TextEditingController();
  TextEditingController _regNoController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _supportNoController = TextEditingController();
  TextEditingController _highlightController = TextEditingController();
  TextEditingController _mainImageController = TextEditingController();
  TextEditingController _inImageController = TextEditingController();
  TextEditingController _exImageController = TextEditingController();

  @override
  void initState() {
    initData();
    super.initState();
  }


  void initData() {
    FormData formData = Provider.of(context,listen: false);

     _variantController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.variant}":"");
     _kmsController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.kilometers}":"");
     _yearOfManufactureController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.year}":"");
     _basePriceController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.basePrice}":"");
     _expectedPriceController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.expectedPrice}":"");
     _regNoController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.reno}":"");
     _descriptionController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.description}":"");
     _supportNoController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.supportNo}":"");
     _highlightController = TextEditingController(text: formData.uploadCar!=null?"${formData.uploadCar.variant}":'');
     _mainImageController = TextEditingController();
     _inImageController = TextEditingController();
     _exImageController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of<FormData>(context);

    final AuctionProvider auctionProvider = Provider.of(context);
    final AuthProvider authProvider = Provider.of(context);

    UploadCar uploadCar = formData.uploadCar;

    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             DropdownButtonFormField(
                  items:  formData.company!=null?formData.company.map((e) {
                    return DropdownMenuItem(child: (Text(e.name)), value: e.id,);
                  }).toList():[DropdownMenuItem(child: (Text("")), value: "sample")],
                  onChanged: (newValue) {
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
                  formData.uploadCar.car = newValue;
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
                      radioWidget(formData, "Diesel", "Diesel"),
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
                onChanged: (val){
                  formData.uploadCar.variant = val;
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Kms"),
                controller: _kmsController,
                onChanged: (val){
                  formData.uploadCar.kilometers = val;
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Year of manufacture"),
                controller: _yearOfManufactureController,
                onChanged: (val){
                  formData.uploadCar.year = val;
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Base price "),
                controller: _basePriceController,
                onChanged: (val){
                  formData.uploadCar.basePrice = int.parse(val);
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Expected price "),
                controller: _expectedPriceController,
                onChanged: (val){
                  uploadCar.expectedPrice = int.parse(val);
                },
              ),
              SizedBox(height: 12,),
              DropdownButtonFormField(
                value: formData.stateDropdown,
                items:  auctionProvider.stateList!=null?auctionProvider.stateList.map((e) {
                  return DropdownMenuItem(value: e.id, child: (Text(e.name)));
                }).toList():[DropdownMenuItem(child: (Text("")), value: "") ],
                onChanged: (String newValue) {
                  formData.stateDropdown = newValue;
                  formData.uploadCar.state=newValue;
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
                  formData.uploadCar.office=newValue;
                },
                decoration: InputDecoration(

                    labelText: "RT office",
                    labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR)
                ),
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Reg no"),
                // controller: _regNoController,
                onChanged: (val){
                  formData.uploadCar.regNo = val;
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Description"),
                // controller: _descriptionController,
                onChanged: (val){
                  formData.uploadCar.description = val;
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                decoration: decoration("Support number"),
                // controller: _supportNoController,
                onChanged: (val){
                  formData.uploadCar.supportNo = val;
                },
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
                            showBottom(context, () async {
                              Navigator.pop(context);
                              PickedFile result = await pickCameraImages();
                              if(result!=null){
                                formData.mainImage = PlatformFile(path: result.path);
                              }
                            }, (){
                              Navigator.pop(context);
                              pickImages(false).then((filePickerResult){
                                if(filePickerResult!=null){
                                  formData.mainImage = filePickerResult.files.first;
                                }
                              });
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
                                // controller: _mainImageController,
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
                           showBottom(context, () async {
                             Navigator.pop(context);
                             PickedFile result = await pickCameraImages();
                             if(result!=null){
                               formData.addToInteriorImage([PlatformFile(path: result.path)]);
                             }
                           }, () async {
                             Navigator.pop(context);
                             FilePickerResult filePickerResult  = await pickImages(true);
                             if(filePickerResult!=null){
                               formData.addToInteriorImage(filePickerResult.files);
                             }


                           });
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
                                      // controller: _inImageController,
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
                        onPressed: () {
                        showBottom(context, () async {
                          Navigator.pop(context);
                          PickedFile result = await pickCameraImages();
                          if(result!=null){
                            formData.addToExteriorImage([PlatformFile(path: result.path)]);
                          }
                        }, () async {
                          Navigator.pop(context);
                          FilePickerResult filePickerResult  = await pickImages(true);
                          if(filePickerResult!=null){
                            formData.addToExteriorImage(filePickerResult.files);
                          }
                        });
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
                    formData.activeStep=1;
                   // formData.stepCount=1;
                  } ,
                  child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: PRIMARY_COLOR,

                ),
              )



            ],
          ),
        ),
      ],
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

  Future<PickedFile> pickCameraImages() async {
    PickedFile file = await ImagePicker().getImage(source: ImageSource.camera,);
    if(file!=null){
      return file;
    }else{
      return null;
    }
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

