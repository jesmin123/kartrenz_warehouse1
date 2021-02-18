import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ExpandDetailPage extends StatefulWidget {
  @override
  _ExpandDetailPageState createState() => _ExpandDetailPageState();
}

class _ExpandDetailPageState extends State<ExpandDetailPage> {

  List<String> imgList = [
    "assets/images/222.jpg",
    "assets/images/222.jpg",
    "assets/images/222.jpg",
    "assets/images/222.jpg",
  ];

  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for(var  i=0; i< list.length; i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    FormData formData = Provider.of(context);
    return Scaffold(
      appBar: appBar(context, "Cars"),
      body: SingleChildScrollView  (
        child: Column(
          children: [
            SizedBox(height: 24,),
            ExpansionTile(
              leading: Text("Document Details", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
              trailing: rating("2"),
              children: [
                Card(
                  child: Column(
                    children: [
                      documentWidget("manufacturingYr", "sample"),
                      Divider(),
                      documentWidget("chassisNoEmossing", "sample"),
                      Divider(),
                      documentWidget("CNGLPGFitment", "sample"),
                      Divider(),
                      documentWidget("registrationDate", "sample"),
                      Divider(),
                      documentWidget("insuranceType", "sample"),
                      Divider(),
                      documentWidget("insuranceExpiryDate", "sample"),
                      Divider(),
                      documentWidget("noclaimBonus", "sample"),
                      Divider(),
                      documentWidget("noclaimBonusPercentage", "sample"),
                      Divider(),
                      documentWidget("fitnessupto", "sample"),
                      Divider(),
                      documentWidget("RCavailability", "sample"),
                      Divider(),
                      documentWidget("RCCondition", "sample"),
                      Divider(),
                      documentWidget("RTO", "sample"),
                      Divider(),
                      documentWidget("partipheshiRequest", "sample"),
                      Divider(),
                      documentWidget("roadTaxpaid", "sample"),
                      Divider(),
                      documentWidget("RTONOCissued", "sample"),
                      Divider(),
                      documentWidget("underHypothecation", "sample"),
                      Divider(),
                      documentWidget("duplicateKey", "sample"),
                      Divider(),
                      documentWidget("rating", "sample"),
                      Divider(),
                      documentWidget("custom", "sample"),


                    ],
                  ),
                )
              ],
            ),
            ExpansionTile(
              leading: Text("Engine + Transmission", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating("2"),
              children: [
                Card(
                  child: Column(
                    children: [
                      enginetWidget("Engine", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Engine Mounting", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Engine Oil", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Engine Oil Level Dipstick", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Engine Sound", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Exhaust Smoke", tittle2: "Sample"),
                      Divider(),
                      enginetWidget("Engine Video",  height: 200)
                    ],
                  ),
                )
              ],

            ),
            ExpansionTile(
              leading: Text("Air Conditioning", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating("2"),
              children: [
                airWidget("ACCooling", "yes"),
                Divider(),
                airWidget("Heater", "no"),
                Divider(),
                airWidget("ClimateChangeControlAC", "no"),
                Divider(),
                airWidget("BlowerMotorNoise", "yes"),
                Divider(),
                airWidget("Rating", "4"),
                Divider(),
              ],
    ),
            ExpansionTile(
              leading: Text("Electricals + Interiors", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating("2")
            ),
            ExpansionTile(
              leading: Text("Exterior + Tyres", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating("2")
            ),
            ExpansionTile(
              leading: Text("Steering Suspension + Brakes", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
              trailing: rating("2")
            ),
            SizedBox(height: 32,),
            Text("Images", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 20.0) ),
            SizedBox(height: 16,),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                initialPage: 0,
                height: 300,
                onPageChanged: (index, reason){
                  formData.current = index;
                }

              ),
              items: imgList.map((img){
                 return Builder(
                     builder: (context){
                       return Container(
                         width: MediaQuery.of(context).size.width,
                         margin: EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(color: Colors.green,),
                         child: Image.asset(img, fit: BoxFit.fill,),
                       );
                     }
                 );
              }).toList()
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map(imgList, (index, url ){
                 return Container(
                   width: 10,
                   height: 10,
                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                   decoration: BoxDecoration(shape: BoxShape.circle,
                   color: formData.current ==index? PRIMARY_COLOR:Colors.grey
                   ) ,
                 );
              }),
            )

          ]
        ),
    )
    );
  }
}

Widget rating(String rating){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(width: 16,),
      Icon(Icons.star, color: PRIMARY_COLOR,),
      Text(rating+"/"+"5", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
      SizedBox(width: 24,),
      Icon(Icons.arrow_forward_ios_outlined, size: 18,)
    ],
  );
}

 Widget documentWidget(String tittle1, String tittle2){
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittle1, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
          Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
        ],
      ),
    ),
  );
 }

Widget enginetWidget(String tittle1, {String tittle2, double height}){
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;
  _videoPlayerController = VideoPlayerController.network("https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4");
  _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio:16/12,
      autoPlay: false,
      looping: false,
      allowFullScreen: false
  );
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tittle1, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
              tittle2!=null?Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ):Container(),
            ],
          ),

        height!=null?Container(
            height: height,
            child: Chewie(controller: _chewieController),
          ):Container()
        ],
      ),
    ),
  );
}


Widget airWidget(String tittle1, String tittle2){
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tittle1, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
              Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
            ],
          ),
          tittle2=="yes"?Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/222.jpg"),
          ):Container()

        ],
      ),
    ),
  );
}