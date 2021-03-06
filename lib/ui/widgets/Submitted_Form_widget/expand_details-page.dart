import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/model/ImageModel.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/utilis/no_image_utilis.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ExpandDetailPage extends StatefulWidget {
  @override
  _ExpandDetailPageState createState() => _ExpandDetailPageState();
}

class _ExpandDetailPageState extends State<ExpandDetailPage> {

  List<String> imgList = [
    "assets/images/137.jpg",
  ];


  @override
  Widget build(BuildContext context) {

    FormData formData = Provider.of(context);
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);
    AuctionProvider auctionProvider = Provider.of(context);
    AuthProvider authProvider = Provider.of(context);
    CarWarehouseModel1 car = submittedCarsProvider.activeCar;




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
                      carDetails("${car.company.car.name}", "${car.car.name}"),
                      carDetails("Reg No", "${car.regNo}"),
                      carDetails("Uploaded", "${authProvider.loginModel.locationCode}"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ExpansionTile(
              leading: Text("Document Details", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
              trailing: rating(car.getDocumentDetail().rating!=null?car.getDocumentDetail().rating:""),
              children: [
                Card(
                  child: Column(
                    children: [
                      documentWidget("manufacturingYr", car.getDocumentDetail().manufacturingYr),
                      Divider(),
                      documentWidget("chassisNoEmossing", car.getDocumentDetail().chassisNoEmossing),
                      Divider(),
                      documentWidget("CNGLPGFitment", car.getDocumentDetail().CNGLPGFitment),
                      Divider(),
                      documentWidget("registrationDate", car.getDocumentDetail().registrationDate),
                      Divider(),
                      documentWidget("insuranceType", car.getDocumentDetail().insuranceType),
                      Divider(),
                      documentWidget("insuranceExpiryDate", car.getDocumentDetail().insuranceExpiryDate),
                      Divider(),
                      documentWidget("noclaimBonus", car.getDocumentDetail().noclaimBonus),
                      Divider(),
                      documentWidget("noclaimBonusPercentage", car.getDocumentDetail().noclaimBonusPercentage),
                      Divider(),
                      documentWidget("fitnessupto", car.getDocumentDetail().fitnessupto),
                      Divider(),
                      documentWidget("RCavailability", car.getDocumentDetail().RCavailability),
                      Divider(),
                      documentWidget("RCCondition", car.getDocumentDetail().RCCondition),
                      Divider(),
                      documentWidget("RTO", car.getDocumentDetail().RTO),
                      Divider(),
                      documentWidget("partipheshiRequest", car.getDocumentDetail().partipheshiRequest),
                      Divider(),
                      documentWidget("roadTaxpaid", car.getDocumentDetail().roadTaxpaid),
                      Divider(),
                      documentWidget("RTONOCissued", car.getDocumentDetail().RTONOCissued),
                      Divider(),
                      documentWidget("underHypothecation", car.getDocumentDetail().underHypothecation),
                      Divider(),
                      documentWidget("duplicateKey", car.getDocumentDetail().duplicateKey),
                      Divider(),
                      documentWidget("rating", car.getDocumentDetail().rating),
                      Divider(),



                    ],
                  ),
                )
              ],
            ),
            ExpansionTile(
              leading: Text("Engine + Transmission", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating(car.ratingEngine!=null?car.ratingEngine.toString():""),
              children: [
                Card(
                  child: Column(
                    children: [
                      enginetWidget("Engine", tittle2: car.engine),
                      Divider(),
                      enginetWidget("Engine Mounting", tittle2: car.engineMounting),
                      Divider(),
                      enginetWidget("Engine Oil", tittle2: car.engineOil),
                      Divider(),
                      enginetWidget("Engine Oil Level Dipstick", tittle2: car.engineOilLevelDipstick),
                      Divider(),
                      enginetWidget("Engine Sound", tittle2: car.engineSound),
                      Divider(),
                      enginetWidget("Exhaust Smoke", tittle2: car.exhaustSmoke),
                      Divider(),
                      enginetWidget("Engine Video", url: car.engineVideo)
                    ],
                  ),
                )
              ],

            ),
            ExpansionTile(
              leading: Text("Air Conditioning", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating(car.getACDetail().rating!=null?car.getACDetail().rating.toString():""),
              children: [
                Card(
                  child: Column(
                    children: [
                      airWidget("ACCooling", car.getACDetail().ACCooling,images: auctionProvider.carImages['ACCooling']),
                      Divider(),
                      airWidget("Heater", car.getACDetail().Heater,images: auctionProvider.carImages['Heater,']),
                      Divider(),
                      airWidget("ClimateChangeControlAC", car.getACDetail().ClimateChangeControlAC,images: auctionProvider.carImages['ClimateChangeControlAC']),
                      Divider(),
                      airWidget("BlowerMotorNoise", car.getACDetail().BlowerMotorNoise, images: auctionProvider.carImages['BlowerMotorNoise']),
                      Divider(),
                      airWidget("Rating", car.getACDetail().rating.toString()),
                    ],
                  ),
                )
              ],
    ),
            ExpansionTile(
              leading: Text("Electricals + Interiors", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating(car.getElectricDetail().rating!=null?car.getElectricDetail().rating.toString():""),
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
                          airWidget("LHS Front", car.getElectricDetail().powerWindowLHSFront, images: auctionProvider.carImages['powerWindowLHSFront']),
                          Divider(),
                          airWidget("LHS Rear", car.getElectricDetail().powerWindowLHSRear, images: auctionProvider.carImages['powerWindowLHSRear']),
                          Divider(),
                          airWidget("RHS Front", car.getElectricDetail().powerWindowRHSFront, images: auctionProvider.carImages['powerWindowRHSFront']),
                          Divider(),
                          airWidget("RHS Rear", car.getElectricDetail().powerWindowRHSRear, images: auctionProvider.carImages['powerWindowRHSRear']),
                          Divider(),
                          airWidget("airbagFeature", car.getElectricDetail().airbagFeature, images: auctionProvider.carImages['musicSystem']),
                          Divider(),
                          airWidget("musicSystem", car.getElectricDetail().musicSystem, images: auctionProvider.carImages['musicSystem']),
                          Divider(),
                          airWidget("leatherSeat", car.getElectricDetail().leatherSeat, images: auctionProvider.carImages['leatherSeat']),
                          Divider(),
                          airWidget("fabricSeat", car.getElectricDetail().fabricSeat, images: auctionProvider.carImages['fabricSeat']),
                          Divider(),
                          airWidget("sunroof", car.getElectricDetail().sunroof, images: auctionProvider.carImages['sunroof']),
                          Divider(),
                          airWidget("steelMountedAudioControl", car.getElectricDetail().steelMountedAudioControl, images: auctionProvider.carImages['steelMountedAudioControl']),
                          Divider(),
                          airWidget("ABS", car.getElectricDetail().ABS, images: auctionProvider.carImages['ABS']),
                          Divider(),
                          airWidget("rearDefogger", car.getElectricDetail().rearDefogger, images: auctionProvider.carImages['rearDefogger']),
                          Divider(),
                          airWidget("reverseCamera", car.getElectricDetail().reverseCamera, images: auctionProvider.carImages['reverseCamera']),
                          Divider(),
                          //TODO implement electrical and interior
                          airWidget("electrical", car.getElectricDetail().electrical, images: auctionProvider.carImages['BlowerMotorNoise']),
                          Divider(),
                          airWidget("interior", car.getElectricDetail().interior, images: auctionProvider.carImages['BlowerMotorNoise']),
                          Divider(),
                          airWidget("Rating", car.getElectricDetail().rating.toString()),
                          Divider(),

                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            ExpansionTile(
              leading: Text("Exterior + Tyres", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
                trailing: rating(car.getExteriorDetail().rating!=null?car.getExteriorDetail().rating.toString():""),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          airWidget("Roof", car.getExteriorDetail().Roof, images: auctionProvider.carImages['Roof']),
                          Divider(),
                          airWidget("BonnetorHood", car.getExteriorDetail().BonnetorHood, images: auctionProvider.carImages['BonnetorHood']),
                          Divider(),
                          airWidget("DickyDoororBootDoor", car.getExteriorDetail().DickyDoororBootDoor, images: auctionProvider.carImages['DickyDoororBootDoor']),
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
                          airWidget("QuarterPanelLHS", car.getExteriorDetail().QuarterPanelLHS, images: auctionProvider.carImages['QuarterPanelLHS']),
                          Divider(),
                          airWidget("QuarterPanelRHS", car.getExteriorDetail().QuarterPanelRHS, images: auctionProvider.carImages['QuarterPanelRHS']),
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

                          airWidget("FenderLHS", car.getExteriorDetail().FenderLHS, images: auctionProvider.carImages['FenderLHS']),
                          Divider(),
                          airWidget("FenderRHS", car.getExteriorDetail().FenderRHS, images: auctionProvider.carImages['FenderRHS']),
                          Divider(),
                          airWidget("Pillar", car.getExteriorDetail().Pillar, images: auctionProvider.carImages['Pillar']),
                          Divider(),
                          airWidget("Apron", car.getExteriorDetail().Apron, images: auctionProvider.carImages['Apron']),
                          Divider(),
                          airWidget("Firewall", car.getExteriorDetail().Firewall, images: auctionProvider.carImages['Firewall']),
                          Divider(),
                          airWidget("CowlTop", car.getExteriorDetail().CowlTop, images: auctionProvider.carImages['CowlTop']),
                          Divider(),
                          airWidget("UpperCrossMember", car.getExteriorDetail().UpperCrossMember, images: auctionProvider.carImages['UpperCrossMember']),
                          Divider(),
                          airWidget("LowerCrossMember", car.getExteriorDetail().LowerCrossMember, images: auctionProvider.carImages['LowerCrossMember']),
                          Divider(),
                          airWidget("RadiatorSupport", car.getExteriorDetail().RadiatorSupport, images: auctionProvider.carImages['RadiatorSupport']),
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
                          airWidget("RunningBorderLHS", car.getExteriorDetail().RunningBorderLHS, images: auctionProvider.carImages['RunningBorderLHS']),
                          Divider(),
                          airWidget("RunningBorderRHS", car.getExteriorDetail().RunningBorderRHS, images: auctionProvider.carImages['RunningBorderRHS']),
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
                          airWidget("DoorLHSFront ", car.getExteriorDetail().DoorLHSFront, images: auctionProvider.carImages['DoorLHSFront']),
                          Divider(),
                          airWidget("DoorLHSRear", car.getExteriorDetail().DoorLHSRear, images: auctionProvider.carImages['DoorLHSRear']),
                          Divider(),
                          airWidget("DoorRHSFront", car.getExteriorDetail().DoorRHSFront, images: auctionProvider.carImages['DoorRHSFront']),
                          Divider(),
                          airWidget("DoorRHSRear", car.getExteriorDetail().DoorRHSRear, images: auctionProvider.carImages['DoorRHSRear']),
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
                          airWidget("BumperFront ", car.getExteriorDetail().BumperFront, images: auctionProvider.carImages['BumperFront']),
                          Divider(),
                          airWidget("BumperRear", car.getExteriorDetail().BumperRear, images: auctionProvider.carImages['BumperRear']),
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
                          airWidget("WindshieldFront ", car.getExteriorDetail().WindshieldFront, images: auctionProvider.carImages['WindshieldFront']),
                          Divider(),
                          airWidget("WindshieldBack", car.getExteriorDetail().WindshieldBack, images: auctionProvider.carImages['WindshieldBack']),
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
                          airWidget("LHSFogLight", car.getExteriorDetail().LHSFogLight, images: auctionProvider.carImages['LHSFogLight']),
                          Divider(),
                          airWidget("RHSFogLight", car.getExteriorDetail().RHSFogLight, images: auctionProvider.carImages['RHSFogLight']),
                          Divider(),
                          airWidget("LHSHeadlight", car.getExteriorDetail().LHSHeadlight, images: auctionProvider.carImages['LHSHeadlight']),
                          Divider(),
                          airWidget("LHSTaillight", car.getExteriorDetail().LHSTaillight, images: auctionProvider.carImages['LHSTaillight']),
                          Divider(),
                          airWidget("RHSHeadlight", car.getExteriorDetail().RHSHeadlight, images: auctionProvider.carImages['RHSHeadlight']),
                          Divider(),
                          airWidget("RHStaillight", car.getExteriorDetail().RHStaillight, images: auctionProvider.carImages['RHStaillight']),
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
                          airWidget("ORVMLHS", car.getExteriorDetail().ORVMLHS, images: auctionProvider.carImages['ORVMLHS']),
                          Divider(),
                          airWidget("ORVMRHS", car.getExteriorDetail().ORVMRHS, images: auctionProvider.carImages['ORVMRHS']),
                          Divider(),
                          airWidget("AlloyWheels", car.getExteriorDetail().AlloyWheels, images: auctionProvider.carImages['AlloyWheels']),
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
                          airWidget2("LHSFrontTyre", car.getExteriorDetail().LHSFrontTyre, images: auctionProvider.carImages['LHSFrontTyre'] ),
                          Divider(),
                          airWidget2("RHSFrontTyre", car.getExteriorDetail().RHSFrontTyre, images: auctionProvider.carImages['RHSFrontTyre']),
                          Divider(),
                          airWidget2("LHSRearTyre", car.getExteriorDetail().LHSRearTyre, images: auctionProvider.carImages['LHSRearTyre']),
                          Divider(),
                          airWidget2("RHSRearTyre", car.getExteriorDetail().RHSRearTyre, images: auctionProvider.carImages['RHSRearTyre']),
                          Divider(),
                          airWidget2("SpareTyre", car.getExteriorDetail().SpareTyre, images: auctionProvider.carImages['SpareTyre']),
                          Divider(),
                          airWidget("rating", car.getExteriorDetail().rating.toString()),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            ExpansionTile(
              leading: Text("Steering Suspension + Brakes", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
              trailing: rating("${car.getSteeringDetail().rating}"),
              children: [
                Card(
                  child: Column(
                    children: [
                      airWidget2("steering", car.getSteeringDetail().steering, images: auctionProvider.carImages['steering']),
                      Divider(),
                      airWidget2("suspension", car.getSteeringDetail().suspension, images: auctionProvider.carImages['suspension']),
                      Divider(),
                      airWidget2("brake", car.getSteeringDetail().brake, images: auctionProvider.carImages['brake']),
                      Divider(),
                      airWidget("rating", car.getSteeringDetail().rating.toString()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 22,),
            FlatButton(onPressed: (){
              Navigator.pushNamed(context, CAR_IMAGES_WIDGET);
            }, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("View Images", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
                Icon(Icons.arrow_forward_ios_outlined, size: 18,)
              ],
            )),


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
          Text(""
              "${tittle1}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
          Text("${tittle2}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
        ],
      ),
    ),
  );
 }

Widget enginetWidget(String tittle1, {String tittle2, double height, String url}){
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;
  _videoPlayerController = VideoPlayerController.network("http://kartrenz.com:4000/r/"+"$url");
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

        url!=null?Container(
            child: Chewie(controller: _chewieController),
          ):Container()
        ],
      ),
    ),
  );
}


Widget airWidget(String tittle1, String tittle2,{List<ImageModel> images}){
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
          tittle2=="yes" && images!=null?Container(
            width: 200,
            height: 200,
            child: images.length>0?ImageUtil.network(images.first.image):Container(),
          ):Container()

        ],
      ),
    ),
  );
}
Widget airWidget2(String tittle1, String tittle2, {List<ImageModel> images}){
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittle1, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0) ),
          Column(
            children: [
              tittle2!=null?Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0)):Text(''),
              images!=null?Container(
                width: 200,
                height: 200,
                child: images.length>0?ImageUtil.network(images.first.image):Container(),
              ):Container(),
            ],
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