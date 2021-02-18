import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/provider/electrical_form_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';

class SteeringFormWidget extends StatefulWidget {
  @override
  _SteeringFormWidgetState createState() => _SteeringFormWidgetState();
}

class _SteeringFormWidgetState extends State<SteeringFormWidget> {
  TextEditingController _steeringController = TextEditingController();
  TextEditingController _suspensionController = TextEditingController();
  TextEditingController _brakeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ElectricalFormProvider electricalFormProvider = Provider.of(context);
    return Form(
      child: Column(
        children: [

          tyreWidget(_steeringController, "Steering", electricalFormProvider, "Steering"),
          SizedBox(height: 12,),
          tyreWidget(_suspensionController, "Suspension", electricalFormProvider, "Suspension"),
          SizedBox(height: 12,),
          tyreWidget(_brakeController, "Brake", electricalFormProvider, "Brake"),
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
              electricalFormProvider.steeringRating = rating;
            },
          ),
          SizedBox(height: 24,),
          RaisedButton(
            onPressed:(){
              showAlert(context);
            },
            child: Text("Submit", style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: PRIMARY_COLOR,

          )

        ],
      ),
    );
  }
}

tyreWidget(TextEditingController controller, String label, ElectricalFormProvider electricalFormProvider, String key){
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
                onPressed: () async {
                  FilePickerResult result = await pickImages();
                  electricalFormProvider.updateSteeringImage(key, result.files.first);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: PRIMARY_COLOR)),
              )
          )
        ],
      ),
      SizedBox(height: 8,),
      electricalFormProvider.steeringImage[key]!=null?Column(
        children: [
          Container(
              height: 300,
              width: 300,
              child: Image.file(File(electricalFormProvider.steeringImage[key].path),
              )
          ),
          FlatButton(onPressed: (){
            electricalFormProvider.removeFromSteeringImage(key);
          }, child: Row(children: [
            Text("Delete", style: AppFontStyle.headingTextStyle2(APP_RED_COLOR),),
            Icon(Icons.delete, color: APP_RED_COLOR,)
          ],))
        ],
      ):Container()
    ],
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

Widget showAlert(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Car Details Added Successfully", style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),),
              Divider(),
              FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, HOME_PAGE);
                  },
                  child: Text("Ok", style: AppFontStyle.labelTextStyle2(PRIMARY_COLOR),)
              ),

            ],
          ),
        );
      }
  );
}
