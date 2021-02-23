import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ExpandedAcceptedWidget extends StatefulWidget {
  @override
  _ExpandedAcceptedWidgetState createState() => _ExpandedAcceptedWidgetState();
}

class _ExpandedAcceptedWidgetState extends State<ExpandedAcceptedWidget> {
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
                SizedBox(height: 12,),
                Container(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12,bottom: 16, top: 16, left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carDetails("Jeep", "Compass"),
                          carDetails("Reg No", "KL-01-0202"),
                          carDetails("Uploaded", "Main branch pala"),
                        ],
                      ),
                    ),
                  ),
                ),
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
                    Card(
                      child: Column(
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
                        ],
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Text("Electricals + Interiors", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                  trailing: rating("2"),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Power Window", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("LHS Front", "no"),
                              Divider(),
                              airWidget("LHS Rear", "yes"),
                              Divider(),
                              airWidget("RHS Front", "no"),
                              Divider(),
                              airWidget("RHS Rear", "no"),
                              Divider(),
                              airWidget("Heater", "no"),
                              Divider(),
                              airWidget("airbagFeature", "no"),
                              Divider(),
                              airWidget("musicSystem", "yes"),
                              Divider(),
                              airWidget("leatherSeat", "no"),
                              Divider(),
                              airWidget("fabricSeat", "no"),
                              Divider(),
                              airWidget("sunroof", "no"),
                              Divider(),
                              airWidget("steelMountedAudioControl", "no"),
                              Divider(),
                              airWidget("ABS", "yes"),
                              Divider(),
                              airWidget("rearDefogger", "no"),
                              Divider(),
                              airWidget("reverseCamera", "no"),
                              Divider(),
                              airWidget("electrical", "no"),
                              Divider(),
                              airWidget("interior", "no"),
                              Divider(),
                              airWidget("Rating", "4"),
                              Divider(),
                              airWidget("custom", "[ ]"),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Text("Exterior + Tyres", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                  trailing: rating("2"),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: Column(
                            children: [
                              airWidget("Roof", "no"),
                              Divider(),
                              airWidget("BonnetorHood", "no"),
                              Divider(),
                              airWidget("DickyDoororBootDoor", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Quarter Panel", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("QuarterPanelLHS", "no"),
                              Divider(),
                              airWidget("QuarterPanelRHS", "yes"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Fender", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("FenderLHS", "no"),
                              Divider(),
                              airWidget("FenderRHS", "no"),
                              Divider(),
                              airWidget("Pillar", "no"),
                              Divider(),
                              airWidget("Apron", "yes"),
                              Divider(),
                              airWidget("Firewall", "yes"),
                              Divider(),
                              airWidget("CowlTop", "no"),
                              Divider(),
                              airWidget("UpperCrossMember", "no"),
                              Divider(),
                              airWidget("LowerCrossMember", "no"),
                              Divider(),
                              airWidget("RadiatorSupport", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Running Border", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("RunningBorderLHS", "no"),
                              Divider(),
                              airWidget("RunningBorderRHS", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Door", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("DoorLHSFront ", "no"),
                              Divider(),
                              airWidget("DoorLHSRear", "no"),
                              Divider(),
                              airWidget("DoorRHSFront", "no"),
                              Divider(),
                              airWidget("DoorRHSRear", "yes"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Bumper", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("BumperFront ", "no"),
                              Divider(),
                              airWidget("BumperRear", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Wind Shield", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("WindshieldFront ", "no"),
                              Divider(),
                              airWidget("WindshieldBack", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Light", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("LHSFogLight", "no"),
                              Divider(),
                              airWidget("RHSFogLight", "yes"),
                              Divider(),
                              airWidget("LHSHeadlight", "no"),
                              Divider(),
                              airWidget("LHSTaillight", "no"),
                              Divider(),
                              airWidget("RHSHeadlight", "no"),
                              Divider(),
                              airWidget("RHStaillight", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ORVM - Manual / Electrical", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget("ORVMLHS", "no"),
                              Divider(),
                              airWidget("ORVMRHS", "yes"),
                              Divider(),
                              airWidget("AlloyWheels", "no"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tyre", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                        ),
                        Card(
                          child: Column(
                            children: [
                              airWidget2("LHSFrontTyre"),
                              Divider(),
                              airWidget2("RHSFrontTyre"),
                              Divider(),
                              airWidget2("LHSRearTyre"),
                              Divider(),
                              airWidget2("RHSRearTyre"),
                              Divider(),
                              airWidget2("SpareTyre"),
                              Divider(),
                              airWidget("rating", "2"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Text("Steering Suspension + Brakes", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                  trailing: rating("2"),
                  children: [
                    Card(
                      child: Column(
                        children: [
                          airWidget2("steering"),
                          Divider(),
                          airWidget2("suspension"),
                          Divider(),
                          airWidget2("brake"),
                          Divider(),
                          airWidget("rating", "2"),
                        ],
                      ),
                    ),
                  ],
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
Widget airWidget2(String tittle1,){
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittle1, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/222.jpg"),
          )
        ],
      ),
    ),
  );
}

Widget carDetails(String tittle1, String tittle2){
  return Column(
    children: [
      Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
      Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),)
    ],
  );
}