import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/constants/strings.dart';

class AcceptedDetailWidget extends StatefulWidget {
  @override
  _AcceptedDetailWidgetState createState() => _AcceptedDetailWidgetState();
}

class _AcceptedDetailWidgetState extends State<AcceptedDetailWidget> {
  @override
  Widget build(BuildContext context) {
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
                      carDetails("Jeep", "Compass"),
                      carDetails("Reg No", "KL-01-0202"),
                      carDetails("Uploaded", "Main branch pala"),
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
                      Image.asset(
                        "assets/images/222.jpg",
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carDetails2("Audi", "Q8"),
                          carDetails2("Year", "2015"),
                          carDetails2("variant", "LXI"),
                          carDetails2("Reg No", "KL-02-8976"),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          carDetails3(Icons.directions_car_sharp, "Petrol"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.speed, "450000"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.calendar_today_outlined, "2016"),
                          Container(
                            width: 1,
                            height: 24,
                            color: APP_BLACK_COLOR,
                          ),
                          carDetails3(Icons.account_tree_rounded, "Manual"),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Text("Description", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
                      SizedBox(height: 8,),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magnaaliqua. Ut enim ad minim veniam, quis nostrud exercitationullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, EXPANDED_ACCEPTED_WIDGET);
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

