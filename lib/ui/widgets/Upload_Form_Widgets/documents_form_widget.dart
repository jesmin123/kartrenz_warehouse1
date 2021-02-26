import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/DocumentDetails.dart';
import 'package:kartenz/model/Upload_Model.dart';
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
    FormData formData = Provider.of(context);
    return Form(
        child:Column(
          children: [
            TextFormField(
              decoration: decoration("Manufacturing Month / Year"),
              controller: _manufacturingController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Chassis No. Emossing"),
              controller: _chassisController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("CNG/LPG Fitment"),
              controller: _cNGController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Registration Date"),
              controller: _registrationController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Base price "),
              controller: _chassisController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Insurance Type"),
              controller: _insuranceController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Insurance Expiry Date"),
              controller: _insuranceExpiryController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("No claim Bonus"),
              controller: _noClaimController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("No claim Bonus Percentage"),
              controller: _noClaimPercentController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Fitness upto"),
              controller: _fitnessController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RC Availability "),
              controller: _rcAvailabilityController ,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RC condition"),
              controller: _rcConditionController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Partipheshi request"),
              controller: _partipheshiController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Road tax paid"),
              controller: _roadTaxController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("RTO NOC issued"),
              controller: _rTONOCController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Under hypothecation"),
              controller: _underHypoController,
            ),
            SizedBox(height: 12,),
            TextFormField(
              decoration: decoration("Duplicate key"),
              controller: _duplicateKeyController,
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Image :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                RaisedButton(
                  onPressed: () async {
                    FilePickerResult filePickerResult = await pickImages();
                    if(filePickerResult!=null){
                      formData.addToDocumentImages(filePickerResult.files);
                    }
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
                    },
                    ),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: RaisedButton(
                onPressed:(){

                  DocumentData documentData = new DocumentData(
                      fitnessupto: _fitnessController.text, CNGLPGFitment: _cNGController.text, chassisNoEmossing: _chassisController.text,
                    duplicateKey: _duplicateKeyController.text, insuranceExpiryDate: _insuranceExpiryController.text,
                    insuranceType: _insuranceController.text, noclaimBonus: _noClaimController.text, noclaimBonusPercentage: _noClaimPercentController.text,
                    partipheshiRequest: _partipheshiController.text, registrationDate: _registrationController.text, underHypothecation: _underHypoController.text,
                    manufacturingYr: _manufacturingController.text, RCavailability: _rcAvailabilityController.text, RCCondition: _rcConditionController.text,
                    roadTaxpaid: _roadTaxController.text, RTONOCissued: _rTONOCController.text, rating: formData.rating
                  );
                  formData.activeStep=2;
                  formData.stepCount=2;
                },
                child: Text("Next", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: PRIMARY_COLOR,

              ),
            )


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

InputDecoration decoration(String label){
  return InputDecoration(

    labelText: label,
    labelStyle: AppFontStyle.bodyTextStyle2(APP_BLACK_COLOR),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PRIMARY_COLOR),
    ),
  );
}
