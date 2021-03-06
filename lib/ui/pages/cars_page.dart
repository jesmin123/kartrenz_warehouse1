import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/ui/widgets/Accepted_Form_Widget/accepted_form_widget.dart';
import 'package:kartenz/ui/widgets/Modify_Form_Widget/modify_form_widget.dart';
import 'package:kartenz/ui/widgets/Rejected_form_Widget/Rejected_Form_Widget.dart';
import 'package:kartenz/ui/widgets/Submitted_Form_widget/submitted_form_widget.dart';
import 'package:kartenz/ui/widgets/upload_tab_widget.dart';

class CarsPage extends StatefulWidget {
  @override
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_WHITE_COLOR,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: APP_BLACK_COLOR,), onPressed: (){Navigator.pop(context);}),
        title: Text("Cars", style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR),)
      ),
      body: Column(
        children: [
          TabBar(
            tabs: <Widget>[
              Tab(text: "Submitted",),
              Tab(text: "Accepted ",),
              Tab(text: "Modify",),
              Tab(text: "Rejected",),
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
                SubmittedFormWidget(),
                AcceptedFormWidget(),
                ModifyFormWidget(),
                RejectedFormWidget(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),

    );
  }
}
