import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';

class AcceptedFormWidget extends StatefulWidget {
  @override
  _AcceptedFormWidgetState createState() => _AcceptedFormWidgetState();
}

class _AcceptedFormWidgetState extends State<AcceptedFormWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_,pos){return SizedBox(height: 12,);},
      itemCount: 6,
      itemBuilder: (_,pos){
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ACCEPTED_DETAIL_WIDGET );
          },
          child: Container(
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
                        Container(
                          width: 1,
                          height: 24,
                          color: APP_BLACK_COLOR,
                        ),
                        carDetails2(Icons.account_tree_rounded, "Manuel"),
                      ],
                    ),
                    SizedBox(height: 12,)

                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}

Widget carDetails(String tittle1, String tittle2){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(tittle1, style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR)),
      Text(tittle2, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
    ],
  );
}

Widget carDetails2(IconData icon, String tittle){
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: 6,),
      Text(tittle)
    ],
  );
}
