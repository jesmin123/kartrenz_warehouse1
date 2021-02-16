 import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../provider/form_data_provider.dart';

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
    BasicProvider basicProvider = Provider.of<BasicProvider>(context);
    FormData formData = Provider.of<FormData>(context);

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
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine sound"),
            controller: _engineSoundController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Exhaust Smoke"),
            controller: _exhaustSmokeController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine mounting"),
            controller: _engineMountingController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Clutch"),
            controller: _clutchController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Gear shifting"),
            controller: _gearShiftingController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine oil"),
            controller: _engineOilController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Engine oil level dipstick"),
            controller: _engineOilLevelController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Battery"),
            controller: _batteryController,
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: decoration("Coolant"),
            controller: _coolantController,
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
                        print("Entered");
                        pickImages([".mp4", ".3gp", ".avi", "wmv", ".flv", ".mpeg"], false).then((value){
                          if(value!=null){
                            basicProvider.engineVideo = value.files.first;
                          }
                        });
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
                        print("Entered");
                       FilePickerResult filePickerResult = await pickImages(['jpg', 'png', 'jpeg'], true);
                       if(filePickerResult!=null){
                         basicProvider.addToEngineImages(filePickerResult.files);
                       }
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

            },
          ),
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: RaisedButton(
              onPressed:(){
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
