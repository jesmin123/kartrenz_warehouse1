import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';

class RejectedFormWidget extends StatefulWidget {
  @override
  _RejectedFormWidgetState createState() => _RejectedFormWidgetState();
}

class _RejectedFormWidgetState extends State<RejectedFormWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_,pos){return SizedBox(height: 12,);},
      itemCount: 6,
      itemBuilder: (_,pos){
        return Container(
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8,top: 4, bottom: 12),
              child: Column(
                children: [
                  SizedBox(height: 6,),
                  Image.asset(
                    "assets/images/222.jpg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      carDetails("Audi", "Q8"),
                      carDetails("Year", "2015"),
                      carDetails("variant", "LXI"),
                      carDetails("Reg No", "KL-02-8976"),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      carDetails2(Icons.directions_car_sharp, "Petrol"),
                      Container(
                        width: 1,
                        height: 24,
                        color: APP_BLACK_COLOR,
                      ),
                      carDetails2(Icons.speed, "450000"),
                      Container(
                        width: 1,
                        height: 24,
                        color: APP_BLACK_COLOR,
                      ),
                      carDetails2(Icons.calendar_today_outlined, "2016"),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      carDetails2(Icons.account_tree_rounded, "Manuel"),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Text("Reason", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
                  SizedBox(height: 8,),
                  Text("sold again",
                    style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}

Widget carDetails(String tittle1, String tittle2){
  return Flexible(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
        Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
      ],
    ),
  );
}

Widget carDetails2(IconData icon, String tittle){
  return Flexible(
    flex: 1,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 6,),
        Text(tittle, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR, textSize: 16.0))
      ],
    ),
  );
}
