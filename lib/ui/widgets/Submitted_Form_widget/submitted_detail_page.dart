import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/ui/utilis/no_image_utilis.dart';
import 'package:provider/provider.dart';

class SubmittedDetailPage extends StatefulWidget {
  @override
  _SubmittedDetailPageState createState() => _SubmittedDetailPageState();
}

class _SubmittedDetailPageState extends State<SubmittedDetailPage> {
  @override
  Widget build(BuildContext context) {
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);
    CarWarehouseModel1 car = submittedCarsProvider.activeCar;
    AuthProvider authProvider = Provider.of(context);

    return Scaffold(
      appBar: appBar(context, "Cars"),
      body: SingleChildScrollView(
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
            SizedBox(height: 6,),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8,top: 4, bottom: 12),
                  child: Column(
                    children: [
                     ImageUtil.banner(car.imageUrl),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carDetails2("${car.company.car.name}", "${car.car.name}"),
                          carDetails2("Year", "${car.year}"),
                          carDetails2("variant", "${car.variant}"),
                          carDetails2("Reg No", "${car.regNo}"),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carDetails3(Icons.directions_car_sharp, "${car.fuel}"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.speed, "${car.kilometers}"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.calendar_today_outlined, "${car.year}"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.account_tree_rounded, "${car.gearShifting}"),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Text("Description", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
                      SizedBox(height: 8,),
                      Text("${car.msg}",
                        style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, EXPAND_DETAILS_PAGE);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text("View more", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
                          SizedBox(height: 8,),
                          Icon(Icons.arrow_forward_ios_outlined, size: 18,)
                        ],),
                      ),


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget carDetails(String tittle1, String tittle2){
  return Column(
    children: [
      Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0)),
      Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),)
    ],
  );
}

Widget carDetails2(String tittle1, String tittle2){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
      Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
    ],
  );
}

Widget carDetails3(IconData icon, String tittle){
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: 6,),
      Text(tittle)
    ],
  );
}
