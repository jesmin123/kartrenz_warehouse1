import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
    BasicProvider basicProvider = Provider.of(context);
    _videoPlayerController = VideoPlayerController.file(File(basicProvider.engineVideo.path));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio:16/12,
      autoPlay: false,
      looping: false,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
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
          SizedBox(height: 12,),
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
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: Chewie(controller: _chewieController)
                    )
                  ],
                )
              ],
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
