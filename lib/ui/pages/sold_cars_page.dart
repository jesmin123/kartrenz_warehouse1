import 'package:flutter/material.dart';
import 'package:kartenz/api/api.dart';
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
  TextEditingController _regNoController = TextEditingController();
  bool sort=false;
  @override
  void initState() {
    initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        controller: _regNoController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(icon: Icon(Icons.clear_rounded), onPressed: (){
                              auctionProvider.transactions = auctionProvider.allTransactions;
                              _regNoController.clear();
                            }),
                              hintText: "Search by regno",
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
                          onPressed: (){
                            auctionProvider.transactions = auctionProvider.allTransactions;
                            auctionProvider.serachSoldCar(_regNoController.text);
                          },
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
                    sortColumnIndex: 6,
                      sortAscending: sort,
                      columns: [
                        DataColumn(label: Text('Cars', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Varient', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Gear', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Year', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Fuel', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Reg No', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                        DataColumn(label: Text('Amount', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR)),onSort:  (columnIndex,ascending){
                          setState(() {
                            sort = !sort;

                          });
                          onSortColum(columnIndex, ascending,auctionProvider);
                        }),
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
  onSortColum(int columnIndex, bool ascending, AuctionProvider auctionProvider) {
   if(columnIndex==6)
        if (ascending) {
          auctionProvider.transactions.sort((a,b)=>a.amount.compareTo(b.amount));
        } else {
          auctionProvider.transactions.sort((a,b)=>b.amount.compareTo(a.amount));
        }
  }

  void initData() {
    AuctionProvider auctionProvider = Provider.of(context, listen: false);
    auctionProvider.transactions = auctionProvider.allTransactions;
  }

}
