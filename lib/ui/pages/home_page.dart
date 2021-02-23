import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/ui/widgets/admin_contact_tab.dart';
import 'package:kartenz/ui/widgets/dashboard_widget.dart';
import 'package:kartenz/ui/widgets/my_profile_tab.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _Key = new GlobalKey<ScaffoldState>();

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    BasicProvider basicProvider = Provider.of(context);
    return WillPopScope(
      onWillPop: ()async{
        showAlert(context);
      },
      child: Scaffold(
        key: _Key,
        appBar: AppBar(
          backgroundColor: APP_WHITE_COLOR,
          leading: IconButton(icon: Icon(Icons.menu_outlined,color: APP_BLACK_COLOR,), onPressed: (){_Key.currentState.openDrawer();}),
          title: Text("Dashboard", style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),),
        ),
        drawer: drawer(context),
        body: Column(
          children: [
            SizedBox(height: 20,),
            CarouselSlider(
              items: [
                DashboardWidget(CAROUSEL1, "Cars Uploaded", "5"),
                DashboardWidget(CAROUSEL2, "Cars Sold", "5"),
                DashboardWidget(CAROUSEL3, "Transactions", "5")
              ],
              options: CarouselOptions(
                height: 220,
                aspectRatio: 16/10,initialPage: 0,
                enlargeCenterPage: true,
                viewportFraction: .5,
                enableInfiniteScroll: false,
              ),
            ),
            SizedBox(height: 32,),
            TabBar(
              tabs: <Widget>[
                Tab(text: "My Profile info",),
                Tab(text: "Admin Contact",),
              ],
              labelStyle: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
              controller: _tabController,
              dragStartBehavior: DragStartBehavior.down,
              indicatorColor: PRIMARY_COLOR,
              labelColor: APP_BLACK_COLOR,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              unselectedLabelColor: APP_BLACK_COLOR,

            ),
            Expanded(
                child: TabBarView(
                  children: [
                    MyProfileTab(),
                    AdminContactTab()
                  ],
                  controller: _tabController,
                )
            )
          ],
        )
      ),
    );



  }

}

Widget alertBox(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Logging Out", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
              SizedBox(height: 8,),
              Text("Are you sure you want to log out?", style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("No", style: AppFontStyle.labelTextStyle2(PRIMARY_COLOR),)
                  ),
                  VerticalDivider(width: 25,thickness: 16,),
                  FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, LOGIN_PAGE);
                      },
                      child: Text("Yes", style: AppFontStyle.labelTextStyle2(PRIMARY_COLOR),)
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}
Widget showAlert(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Are you sure you want to Exit?", style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("No", style: AppFontStyle.labelTextStyle2(PRIMARY_COLOR),)
                  ),
                  VerticalDivider(width: 25,thickness: 16,),
                  FlatButton(
                      onPressed: (){
                        exit(1);
                      },
                      child: Text("Yes", style: AppFontStyle.labelTextStyle2(PRIMARY_COLOR),)
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}
Widget drawer(BuildContext context){
  return Drawer(
    child: Stack(
      children: [
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Image.asset("assets/images/image 3.png", height: 180,),
            SizedBox(height: 6,),
            Column(
              children: [
                Text("Main branch pala", style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),),
                Text('POP_PALA', style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),)
              ],
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, HOME_PAGE);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.apps_outlined),
                        SizedBox(width: 16,),
                        Text("Dashboard", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, CARS_PAGE);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.directions_car_sharp),
                        SizedBox(width: 16,),
                        Text("Cars", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, HOME_PAGE);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.directions_car_sharp),
                        SizedBox(width: 16,),
                        Text("Cars Report", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, HOME_PAGE);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.directions_car_sharp),
                        SizedBox(width: 16,),
                        Text("Sold Cars", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, TRANSACTION_PAGE);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.compare_arrows_sharp),
                        SizedBox(width: 16,),
                        Text("Transactions", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      alertBox(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 16,),
                        Text("Logout", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}


    