import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:provider/provider.dart';
// Dummy comment

class Auctionwidget extends StatefulWidget {
  @override
  _AuctionwidgetState createState() => _AuctionwidgetState();
}

class _AuctionwidgetState extends State<Auctionwidget> {
  final _scrollController = ScrollController();
  TextEditingController _regNoController = TextEditingController();
  bool sort=false;
  int column;
  @override
  Widget build(BuildContext context) {
    AuctionProvider auctionProvider = Provider.of(context);
    return SingleChildScrollView(
      child: Container(
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
                                controller: _regNoController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(icon: Icon(Icons.clear_rounded),onPressed: (){
                                      auctionProvider.auction = auctionProvider.allAuction;
                                      _regNoController.clear();
                                    },),
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
                                  onPressed: (){
                                    auctionProvider.searchAuction(_regNoController.text);
                                  },
                                  child: Text("SEARCH", style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR, textSize: 18.0),),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  color: PRIMARY_COLOR,
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 16,),
                        auctionProvider.auction!=null?Scrollbar(
                          controller: _scrollController,
                          isAlwaysShown: true,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              sortAscending: sort,
                                sortColumnIndex: column,
                                columns: [
                                  DataColumn(label: Text('Reg No', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                                  DataColumn(label: Text('Approval Status', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                                  DataColumn(label: Text('Broker', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR))),
                                  DataColumn(label: Text('Expected Price', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR)),
                                    onSort: (index, ascending){
                                    setState(() {
                                      sort = !sort;
                                      column = 3;
                                    });
                                    onSortColum(index, sort,auctionProvider);
                                    }
                                  ),
                                  DataColumn(label: Text('Current Price', style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR)),
                                      onSort: (index, sort){
                                        setState(() {
                                          sort = !sort;
                                          column = 4;
                                        });
                                        onSortColum(index, sort,auctionProvider);
                                      }
                                  ),
                                ],
                                rows: auctionProvider.auction.map((e) => DataRow(
                                    cells: [
                                      DataCell(Text("${e.cars.regNo}")),
                                      DataCell(Text("${e.cars.isApproved}")),
                                      DataCell(Text("${e.getBroker()}")),
                                      DataCell(Text("${e.cars.expectedPrice}")),
                                      DataCell(Text("${e.getCurrentPrice()} ")),

                                    ]
                                )).toList()
                            ),
                          ),
                        ):Center(child: Text("No Data"))
                      ]
                  )
                ]
            ),
          )
      ),
    );
  }
}

onSortColum(int columnIndex, bool ascending, AuctionProvider auctionProvider) {
  switch(columnIndex){
    case 3 :
      if (ascending) {
        auctionProvider.auction.sort((a,b)=>a.cars.expectedPrice-b.cars.expectedPrice);
      } else {
        auctionProvider.auction.sort((a,b)=>b.cars.expectedPrice-a.cars.expectedPrice);
      }
      break;

    case 4 :
      if (ascending) {
        auctionProvider.auction.sort((a,b)=>int.parse(a.getCurrentPrice())-int.parse(b.getCurrentPrice()));
      } else {
        auctionProvider.auction.sort((a,b)=>int.parse(b.getCurrentPrice())-int.parse(a.getCurrentPrice()));
      }
      break;
  }
}