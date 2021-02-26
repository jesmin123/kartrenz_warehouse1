import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:provider/provider.dart';

class ModifyFormWidget extends StatefulWidget {
  @override
  _ModifyFormWidgetState createState() => _ModifyFormWidgetState();
}

class _ModifyFormWidgetState extends State<ModifyFormWidget> {
  @override
  Widget build(BuildContext context) {
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);
    return ListView.separated(
      separatorBuilder: (_,pos){return SizedBox(height: 12,);},
      itemCount:  submittedCarsProvider.modifyCars.length,
      itemBuilder: (_,pos){
        CarWarehouseModel1 car = submittedCarsProvider.modifyCars[pos];
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
                      carDetails("${car.company.car.name}", "${car.car.name}"),
                      carDetails("Year", "${car.year}"),
                      carDetails("variant", "${car.variant}"),
                      carDetails("Reg No", "${car.regNo}"),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      carDetails2(Icons.directions_car_sharp, "${car.fuel}"),
                      Container(
                        width: 1,
                        height: 24,
                        color: APP_BLACK_COLOR,
                      ),
                      carDetails2(Icons.speed, "${car.kilometers}"),
                      Container(
                        width: 1,
                        height: 24,
                        color: APP_BLACK_COLOR,
                      ),
                      carDetails2(Icons.calendar_today_outlined, "${car.year}"),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      carDetails2(Icons.account_tree_rounded, "${car.gearShifting}"),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Text("Reason", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR,textSize: 20.0, dec: TextDecoration.underline)),
                  SizedBox(height: 8,),
                  Text("${car.msg}",
                    style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR, textSize: 14.0),textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24,),
                  RaisedButton(
                    onPressed: (){
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    color: PRIMARY_COLOR,
                    child: Text('Update', style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR)),
                  )
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