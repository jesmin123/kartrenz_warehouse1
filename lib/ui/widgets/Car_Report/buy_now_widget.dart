import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:provider/provider.dart';

class BuyNowWidget extends StatefulWidget {
  @override
  _BuyNowWidgetState createState() => _BuyNowWidgetState();
}

class _BuyNowWidgetState extends State<BuyNowWidget> {
  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cars", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR,textSize: 22.0),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("All Cars are listed below :", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
            )
          ],
        ),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search by reg no",
                      hintStyle: AppFontStyle.regularTextStyle2(APP_GREY_COLOR),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.grey[100],
                      filled: true
                  )
              ),
            ),

            Flexible(
                flex: 1,
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("SEARCH", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR, textSize: 18.0),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  color: PRIMARY_COLOR,
                )
            )
          ],
        ),
            SizedBox(height: 16,),
            auctionProvider.carReport!=null?SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text('Reg No', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                    DataColumn(label: Text('Status', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                    DataColumn(label: Text('Broker', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                    DataColumn(label: Text('Price', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                  ],
                  rows: auctionProvider.transactions.map((e) => DataRow(
                      cells: [

                        DataCell(Text("${e.carWarehouseModel.regNo}")),
                        DataCell(Text("${e.carWarehouseModel.status}")),
                        DataCell(Text("${e.broker}")),
                        DataCell(Text("${e.amount}")),

                      ]
                  )).toList()
              ),
            ):Center(child: Text("No Data"))
    ]
    )
          ]
        ),
      )
    );
  }
}
