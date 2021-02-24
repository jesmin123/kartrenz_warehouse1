import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/constant_widgets.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:provider/provider.dart';

class SoldCarPage extends StatefulWidget {
  @override
  _SoldCarPageState createState() => _SoldCarPageState();
}

class _SoldCarPageState extends State<SoldCarPage> {
  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);
    return Scaffold(
      appBar: appBar(context, "Car "),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12,),
                Text("Sold Cars", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR,textSize: 22.0),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search...",
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
                auctionProvider.transactions!=null?SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text('Cars', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Varient', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Gear', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Year', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Fuel', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Reg No', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Amount', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Broker', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                      ],
                      rows: auctionProvider.transactions.map((e) => DataRow(
                          cells: [

                            DataCell(Text("${e.carWarehouseModel.car.name}")),
                            DataCell(Text("${e.carWarehouseModel.variant}")),
                            DataCell(Text("${e.carWarehouseModel.gearShifting}")),
                            DataCell(Text("${e.carWarehouseModel.year}")),
                            DataCell(Text("${e.carWarehouseModel.fuel}")),
                            DataCell(Text("${e.carWarehouseModel.regNo}")),
                            DataCell(Text("${e.amount}")),
                            DataCell(Text("${e.broker.name}")),

                          ]
                      )).toList()
                  ),
                ):Text("No data")

              ],
            ),
          ],
        ),
      ),

    );
  }
}
