import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/model/Upload_Model/DocumentDetails.dart';
import 'package:kartenz/model/Upload_Model/Upload_car_model.dart';

import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class DocumentsFormWidet extends StatefulWidget {
  @override
  _DocumentsFormWidetState createState() => _DocumentsFormWidetState();
}

class _DocumentsFormWidetState extends State<DocumentsFormWidet> {
  TextEditingController _manufacturingController = TextEditingController();
  TextEditingController _chassisController = TextEditingController();
  TextEditingController _cNGController = TextEditingController();
  TextEditingController _registrationController = TextEditingController();
  TextEditingController _duplicateKeyController = TextEditingController();
  TextEditingController _insuranceController = TextEditingController();
  TextEditingController _insuranceExpiryController = TextEditingController();
  TextEditingController _noClaimController = TextEditingController();
  TextEditingController _noClaimPercentController = TextEditingController();
  TextEditingController _fitnessController = TextEditingController();
  TextEditingController _rcAvailabilityController = TextEditingController();
  TextEditingController _rcConditionController = TextEditingController();
  TextEditingController _partipheshiController = TextEditingController();
  TextEditingController _roadTaxController = TextEditingController();
  TextEditingController _rTONOCController = TextEditingController();
  TextEditingController _underHypoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of<FormData>(context);
    CarWarehouseModel1 cars = formData.selectedCars;

    UploadCar uploadCar = formData.uploadCar;

    return Form(
        child:Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: decoration("Manufacturing Month / Year"),
              controller: _manufacturingController,
              onChanged: (val){
                uploadCar.documentData.manufacturingYr = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Chassis No. Emossing"),
              controller: _chassisController,
              onChanged: (val){
                uploadCar.documentData.chassisNoEmossing = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("CNG/LPG Fitment"),
              controller: _cNGController,
              onChanged: (val){
                uploadCar.documentData.CNGLPGFitment = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: decoration("Registration Date"),
              controller: _registrationController,
              onChanged: (val){
                uploadCar.documentData.registrationDate = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Insurance Type"),
              controller: _insuranceController,
              onChanged: (val){
                uploadCar.documentData.insuranceType = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Insurance Expiry Date"),
              controller: _insuranceExpiryController,
              onChanged: (val){
                uploadCar.documentData.insuranceExpiryDate = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("No claim Bonus"),
              controller: _noClaimController,
              onChanged: (val){
                uploadCar.documentData.noclaimBonus = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("No claim Bonus Percentage"),
              controller: _noClaimPercentController,
              onChanged: (val){
                uploadCar.documentData.noclaimBonusPercentage = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Fitness upto"),
              controller: _fitnessController,
              onChanged: (val){
                uploadCar.documentData.fitnessupto = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RC Availability "),
              controller: _rcAvailabilityController ,
              onChanged: (val){
                uploadCar.documentData.RCavailability = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RC condition"),
              controller: _rcConditionController,
              onChanged: (val){
                uploadCar.documentData.RCCondition = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Partipheshi request"),
              controller: _partipheshiController,
              onChanged: (val){
                uploadCar.documentData.partipheshiRequest = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Road tax paid"),
              controller: _roadTaxController,
              onChanged: (val){
                uploadCar.documentData.roadTaxpaid = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RTO NOC issued"),
              controller: _rTONOCController,
              onChanged: (val){
                uploadCar.documentData.RTONOCissued = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Under hypothecation"),
              controller: _underHypoController,
              onChanged: (val){
                uploadCar.documentData.underHypothecation = val;
              },
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Duplicate key"),
              controller: _duplicateKeyController,
              onChanged: (val){
                uploadCar.documentData.duplicateKey = val;
              },
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Image :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                RaisedButton(
                  onPressed: () async {
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
                                        onTap: () async {
                                          Navigator.pop(context);
                                          PickedFile result = await pickCameraImages();
                                          if(result!=null){
                                            formData.addToDocumentImages([PlatformFile(path: result.path)]);
                                          }
                                        },
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
                                        onTap: () async {
                                          Navigator.pop(context);
                                          FilePickerResult filePickerResult = await pickImages();
                                          if(filePickerResult!=null){
                                            formData.addToDocumentImages(filePickerResult.files);
                                          }
                                        },
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

                  },
                  color: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                ),
              ],
            ),
            SizedBox(height: 16,),
            formData.documentImages!=null?ListView.separated(
              itemCount: formData.documentImages.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_,pos){
                return SizedBox(height: 12,);},

              itemBuilder: (_,pos){
                return Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.file(File(formData.documentImages[pos].path)),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: TextFormField(
                            decoration: decoration("Description"),
                            //TODO DATA
                          ),
                        ),
                        Flexible(
                          child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                            formData.removeFromDocumentImages(pos);
                          },),
                        )
                      ],
                    ),
                  ],
                );
              },
            ):Container(),
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
                   formData.rating = rating;
                   formData.uploadCar.documentData.rating = rating.toString();
                    },
                    ),
            SizedBox(height: 32,),
          ],
        )
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

Future<PickedFile> pickCameraImages() async {
  PickedFile file = await ImagePicker().getImage(source: ImageSource.camera,);
  if(file!=null){
    return file;
  }else{
    return null;
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
