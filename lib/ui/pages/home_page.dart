
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:kartenz/provider/basic_providers.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/utilis/loader_utilis.dart';
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
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);
    AuctionProvider auctionProvider = Provider.of(context);
    AuthProvider authProvider = Provider.of(context);


    return WillPopScope(
      onWillPop: ()async{
        showAlert(context);
      },
      child: RefreshIndicator(
        onRefresh: (){
          auctionProvider.getAuctionsBuyAll(authProvider.loginModel.token,authProvider.loginModel.id);
          auctionProvider.getTransaction(authProvider.loginModel.id, authProvider.loginModel.token);
          auctionProvider.getBuyAllPurchase( authProvider.loginModel.token,authProvider.loginModel.id);
          auctionProvider.getStateList(authProvider.loginModel.token);
          auctionProvider.postListRt(authProvider.loginModel.token, "5fd8459b3121f4001fe2722b");
          submittedCarsProvider.getSubmittedCars(authProvider.loginModel.token);
          auctionProvider.postUploadNewCar(authProvider.loginModel.token);
          return;
        },
        child: Scaffold(
          key: _Key,
          appBar: AppBar(
            backgroundColor: APP_WHITE_COLOR,
            leading: IconButton(icon: Icon(Icons.menu_outlined,color: APP_BLACK_COLOR,), onPressed: (){_Key.currentState.openDrawer();}),
            title: Text("Dashboard", style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),),
            actions: [
              IconButton(icon: Icon(Icons.refresh,color: Colors.green,), onPressed: (){
                auctionProvider.getAuctionsBuyAll(authProvider.loginModel.token,authProvider.loginModel.id);
                auctionProvider.getTransaction(authProvider.loginModel.id, authProvider.loginModel.token);
                auctionProvider.getBuyAllPurchase( authProvider.loginModel.token,authProvider.loginModel.id);
                auctionProvider.getStateList(authProvider.loginModel.token);
                auctionProvider.postListRt(authProvider.loginModel.token, "5fd8459b3121f4001fe2722b");
                submittedCarsProvider.getSubmittedCars(authProvider.loginModel.token);
                auctionProvider.postUploadNewCar(authProvider.loginModel.token);
                auctionProvider.postCarImage(authProvider.loginModel.token, "6040bacc8bec32002b58a758");
              })
            ],
          ),
          drawer: drawer(context),
          body: Column(
            children: [
              SizedBox(height: 20,),
              CarouselSlider(
                items: [
                  DashboardWidget(CAROUSEL1, "Cars Uploaded", submittedCarsProvider.submittedCars!=null?(submittedCarsProvider.submittedCars.length+submittedCarsProvider.acceptedCars.length+submittedCarsProvider.rejectedCars.length+submittedCarsProvider.modifyCars.length).toString():"0"),
                  DashboardWidget(CAROUSEL2, "Cars Sold", auctionProvider.transactions!=null?auctionProvider.transactions.length.toString():"0"),
                  DashboardWidget(CAROUSEL3, "Transactions", auctionProvider.transactions!=null?auctionProvider.transactions.length.toString():"0")
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
      ),
    );



  }

}

Widget alertBox(BuildContext context,AuthProvider authProvider){
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
                        authProvider.logout();
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
  FormData formData = Provider.of(context);
  AuthProvider authProvider=Provider.of(context);
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
                      Navigator.pop(context);
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
                      Navigator.pop(context);
                      formData.selectedCars= null;
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
                      Navigator.pop(context);
                      Navigator.pushNamed(context, CAR_REPORT_PAGE);
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
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SOLD_CAR_PAGE);
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
                      Navigator.pop(context);
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
                      alertBox(context,authProvider);
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


    