import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/model/CarWareHouse1Model.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/ui/utilis/AlertBox.dart';
import 'package:kartenz/ui/utilis/loader_utilis.dart';
import 'package:kartenz/ui/utilis/no_image_utilis.dart';
import 'package:kartenz/ui/widgets/upload_tab_widget.dart';
import 'package:provider/provider.dart';


class SubmittedFormWidget extends StatefulWidget {
  @override
  _SubmittedFormWidgetState createState() => _SubmittedFormWidgetState();
}

class _SubmittedFormWidgetState extends State<SubmittedFormWidget> {
  @override
  Widget build(BuildContext context) {
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);
    AuthProvider authProvider=Provider.of(context);
    return submittedCarsProvider.submittedCars!=null?Stack(
      children: [
        ListView.separated(
            separatorBuilder: (_,pos){return SizedBox(height: 12,);},
            itemCount: submittedCarsProvider.submittedCars.length,
            itemBuilder: (_,pos){
              CarWarehouseModel1 car = submittedCarsProvider.submittedCars[pos];
              return GestureDetector(
                onTap: (){
                  submittedCarsProvider.activeCar = car;
                  Navigator.pushNamed(context, SUBMITTED_DETAILS_PAGE );
                },
                child: Container(
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8,top: 4, bottom: 12),
                      child: Column(
                        children: [
                          SizedBox(height: 6,),
                          ImageUtil.banner(car.getMainImage()),
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
                          RaisedButton(
                            onPressed: () async {
                              Loader.getLoader(context).show();
                              bool status = await submittedCarsProvider.delete(authProvider.loginModel.token, car.id);
                              Loader.getLoader(context).hide();
                              if(status){
                                AlertBox.showToast("Successfully deleted");
                              }else{
                                AlertBox.showToast("Something wrong");
                              }
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            color: PRIMARY_COLOR,
                            child: Text('Delete', style: AppFontStyle.headingTextStyle2(APP_WHITE_COLOR)),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },

        ),
        FloatingActionButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadTabWidget())),
        )
      ],
    ):Center(child: Text("No Data"));
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
