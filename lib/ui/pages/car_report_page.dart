import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/ui/widgets/Car_Report/auction_widget.dart';
import 'package:kartenz/ui/widgets/Car_Report/buy_now_widget.dart';
import 'package:provider/provider.dart';

class CarReportPage extends StatefulWidget {
  @override
  _CarReportPageState createState() => _CarReportPageState();
}

class _CarReportPageState extends State<CarReportPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: APP_WHITE_COLOR,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: APP_BLACK_COLOR,), onPressed: (){Navigator.pop(context);}),
        title: Text("Car Report", style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "Buy Now",),
            Tab(text: "Auction",),
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
      ),

      body: TabBarView(
        children: [
          BuyNowWidget(),
          Auctionwidget()
        ],
        controller: _tabController,
      ),

    );
  }
}
