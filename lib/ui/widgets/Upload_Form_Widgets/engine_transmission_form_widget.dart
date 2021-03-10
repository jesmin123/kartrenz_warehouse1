 import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/model/Upload_Model/EngineModel.dart';
import 'package:kartenz/model/Upload_Model/Upload_car_model.dart';

import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'documents_form_widget.dart';


class EnginetransmissionFormWidget extends StatefulWidget {
  @override
  _EnginetransmissionFormWidgetState createState() => _EnginetransmissionFormWidgetState();
}

class _EnginetransmissionFormWidgetState extends State<EnginetransmissionFormWidget> {
  TextEditingController _engineController = TextEditingController();
  TextEditingController _engineSoundController = TextEditingController();
  TextEditingController _exhaustSmokeController = TextEditingController();
  TextEditingController _engineMountingController = TextEditingController();
  TextEditingController _clutchController = TextEditingController();
  TextEditingController _gearShiftingController = TextEditingController();
  TextEditingController _engineOilController = TextEditingController();
  TextEditingController _engineOilLevelController = TextEditingController();
  TextEditingController _batteryController = TextEditingController();
  TextEditingController _coolantController = TextEditingController();


  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of<FormData>(context);
    CarWarehouseModel1 cars = formData.selectedCars;

    BasicProvider basicProvider = Provider.of<BasicProvider>(context);

    _videoPlayerController = VideoPlayerController.file(File(basicProvider.engineVideo!=null?basicProvider.engineVideo.path:""));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio:16/12,
      autoPlay: false,
      looping: false,
      allowFullScreen: false
    );

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: decoration("Engine"),
            controller: _engineController,
            onChanged: (val){
              formData.uploadCar.engine = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine sound"),
            controller: _engineSoundController,
            onChanged: (val){
              formData.uploadCar.engineSound = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Exhaust Smoke"),
            controller: _exhaustSmokeController,
            onChanged: (val){
              formData.uploadCar.exhaustSmoke = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine mounting"),
            controller: _engineMountingController,
            onChanged: (val){
              formData.uploadCar.engineMounting = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Clutch"),
            controller: _clutchController,
            onChanged: (val){
              formData.uploadCar.clutch = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Gear shifting"),
            controller: _gearShiftingController,
            onChanged: (val){
              formData.uploadCar.gearShifting = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine oil"),
            controller: _engineOilController,
            onChanged: (val){
              formData.uploadCar.engineOil = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine oil level dipstick"),
            controller: _engineOilLevelController,
            onChanged: (val){
              formData.uploadCar.engineOilLevelDipstick = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Battery"),
            controller: _batteryController,
            onChanged: (val){
              formData.uploadCar.battery = val;
            },
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Coolant"),
            controller: _coolantController,
            onChanged: (val){
              formData.uploadCar.coolant = val;
            },
          ),
          SizedBox(height: 24,),
          Text("Images or videos", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
          Padding(
            padding: const EdgeInsets.only(top: 8,left: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Engine videos :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                    RaisedButton(
                      onPressed: (){
                       showBottom(context, () async {
                         Navigator.pop(context);
                         PickedFile result = await pickCameraVideo();
                         if(result!=null){
                             basicProvider.engineVideo = PlatformFile(path: result.path,);
                       }}, (){
                         Navigator.pop(context);
                         pickImages([".mp4", ".3gp", ".avi", "wmv", ".flv", ".mpeg"], false).then((value){
                           if(value!=null){
                             basicProvider.engineVideo = value.files.first;
                          }
                        });
                      }
                      );
                       },
                      color: PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                    ),
                  ],
                ),

              ],
            ),
          ),
          basicProvider.engineVideo!=null?Column(
            children: [
              Container(width: 300,height: 300,child: Chewie(controller: _chewieController))
            ],
          ):Container(),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(top: 8,left: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Images :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                    RaisedButton(
                      onPressed: () async {
                        showBottom(context, () async {
                          Navigator.pop(context);
                          PickedFile result = await pickCameraImages();
                          if(result!=null){
                            basicProvider.addToEngineImages([PlatformFile(path: result.path)]);
                          }
                        }, () async {
                          Navigator.pop(context);
                        FilePickerResult filePickerResult = await pickImages(['jpg', 'png', 'jpeg'], true);
                        if(filePickerResult!=null){
                        basicProvider.addToEngineImages(filePickerResult.files);
                       }});
                      },
                      color: PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Text("Upload", style: AppFontStyle.titleAppBarStyle2(APP_WHITE_COLOR),),
                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 12,),
          basicProvider.engineImages!=null?ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, pos){
                return Column(
                  children: [
                    Container(
                      child: Image.file(File(basicProvider.engineImages[pos].path)),
                      height: 300,
                      width: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: TextFormField(
                            decoration: decoration("Description"),
                            //TODO
                          ),
                        ),
                        Flexible(
                          child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                            basicProvider.removeFromEngineImages(pos);
                          },),
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context,pos){
                return SizedBox(height: 12,);
              },
              itemCount: basicProvider.engineImages.length
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
              basicProvider.engineRating = rating;
              formData.uploadCar.ratingEngine = rating.toString();
            },
          ),
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: RaisedButton(
              onPressed:(){
                EngineModel engineModel = new EngineModel(
                  rating: basicProvider.engineRating, battery: _batteryController.text, clutch: _clutchController.text,coolant: _coolantController.text,
                  engine: _engineController.text, engineMounting: _engineMountingController.text, engineOil: _engineOilController.text,
                  engineOilLevelDipstick: _engineOilLevelController.text, engineSound: _engineSoundController.text, engineVideo:  basicProvider.engineVideo.path,
                  exhaustSmoke: _exhaustSmokeController.text, gearShifting: _gearShiftingController.text

                );
                  formData.activeStep=3;
                  formData.stepCount=3;
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

  Future<FilePickerResult> pickImages(List<String> extensions, bool allowMultiple) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple,
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if(result!=null){
      return result;
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

 Future<PickedFile> pickCameraVideo() async {
   PickedFile file = await ImagePicker().getVideo(source: ImageSource.camera);
   if(file!=null){
     return file;
   }else{
     return null;
   }
 }
