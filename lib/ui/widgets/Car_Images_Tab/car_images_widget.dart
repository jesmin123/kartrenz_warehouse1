import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/ui/widgets/Car_Images_Tab/exterior_image_widget.dart';
import 'package:provider/provider.dart';

class CarImagesWidget extends StatefulWidget {
  @override
  _CarImagesWidgetState createState() => _CarImagesWidgetState();
}

class _CarImagesWidgetState extends State<CarImagesWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);
    SubmittedCarsProvider submittedCarsProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_WHITE_COLOR,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: APP_BLACK_COLOR,), onPressed: (){Navigator.pop(context);}),
        title: Text("Cars", style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "Exterior",),
            Tab(text: "Interior",),
            Tab(text: "Engine ",),
            Tab(text: "Damages",),
            Tab(text: "Documents",),
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
          ExteriorImageWidget(auctionProvider.carImages[1]),
          ExteriorImageWidget(auctionProvider.carImages[2]),
          ExteriorImageWidget(auctionProvider.carImages[3]),
          ExteriorImageWidget(auctionProvider.carImages[4]),
          ExteriorImageWidget(auctionProvider.carImages[5]),

        ],
        controller: _tabController,
      ),

    );
  }
}
