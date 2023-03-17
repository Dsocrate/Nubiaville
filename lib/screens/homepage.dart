import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubiaville/screens/DropDown.dart';
import 'package:nubiaville/screens/floatingmenu.dart';
import 'package:nubiaville/screens/login.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:nubiaville/Resources/datagrid class.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:intl/intl.dart';
import 'package:nubiaville/utils/utils.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Sales> _sales;
  late SalesDataSource _salesDataSource;
  bool _isExpanded = false;
  late double deviceWidth, deviceHeight;




  @override
  void initState(){
    _sales = getSalesData();
    _salesDataSource = SalesDataSource(_sales);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //toolbarHeight: 100,
          backgroundColor: Color(0xFF0E2038),
          title: Text('Expense Manager'),
          actions: [
            GestureDetector(
              onTap: (){
                showDialog(context: context,
                    builder: (Context) => AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.all(25),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(0.0))),
                      content:  Builder(
                        builder: (context) {
                          return Container(
                            height: deviceHeight*0.27,
                            width: deviceWidth,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  SizedBox(height: 70,),
                                  Text('Welcome To Expense Manager',style: TextStyle(fontSize: 25,color: Colors.black),),
                                  SizedBox(height: 40,),
                                  Text('This is sample Progressive Web App. Try adding it to your Home Screen And using it offline.'),
                                  SizedBox(height: 40,),
                                  Text('this demo is built using Polymer and vaadin components, you can find the source code and fork the project Github'),
                                  SizedBox(height: 30,),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      actions: [
                        Container(
                          height: 35,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Got it!".toUpperCase(),
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth*0.65,
                        )
                      ],
                    ));
              },
              child: Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF213A5C)
                ),
                child: Center(
                  child: Text('INFO',
                  style: TextStyle(
                    color: Colors.blueAccent
                  ),),
                ),
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 5,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF213A5C)
                ),
                child: Center(
                  child: Text('LOG OUT',
                    style: TextStyle(
                        color: Colors.blueAccent
                    ),),
                ),

              ),
            ),
            SizedBox(width: 15,),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: (){
              showDialog(context: context,
                  builder: (Context) => AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.all(25),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(0.0))),
                    content:  Builder(
                      builder: (context) {
                        return Container(
                          height: deviceHeight*0.27,
                          width: deviceWidth,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: FloatMenu(),
                          ),
                        );
                      },
                    ),
                    actions: [
                      Container(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Save".toUpperCase(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 22,),
                      Container(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFd9d9e6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cancel".toUpperCase(),
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(width: 22,),
                      Text(
                        'Delete',
                        style: TextStyle(color: Colors.red,fontSize: 17),
                      )
                    ],
                  ));
          },
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFFf5f7fa),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'To be reimbursed',
                          style: TextStyle(color: Colors.black87,fontSize: 13),
                        ),
                        Text(
                          NumberFormat.currency(symbol: '\$').format(150),
                          style: TextStyle(color: Colors.black87,fontSize: 18),
                        ),
                      ],

                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Filters',
                            style: TextStyle(color: Colors.blue,fontSize: 18),
                          ),
                          Icon(
                            Icons.menu_sharp,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedSizeAndFade(
              child: _isExpanded
                  ? DropDown(Expanded: _isExpanded,)
                  : SizedBox.shrink(),
              fadeDuration: Duration(milliseconds: 300),
              sizeDuration: Duration(milliseconds: 300),

            ),
            Expanded(
              child: SfDataGrid(source: _salesDataSource,
              selectionMode: SelectionMode.multiple,
              allowSorting: true,
       columnResizeMode: ColumnResizeMode.onResize,


       // footer: ,
              columns: [
                //GridDateTimeColumn(mappingName: 'date', headerText: 'Date', format: 'dd/MM/yyyy'),
                GridColumn(columnName: 'date',
                  label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text('Date',overflow: TextOverflow.ellipsis,),),),
                GridColumn(columnName: 'merchant',
                  label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text('Merchants',overflow: TextOverflow.ellipsis,),),),
                GridColumn(columnName: 'total',
                  label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text('Total',overflow: TextOverflow.ellipsis,),),),
                GridColumn(columnName: 'status',
                  label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text('Status',overflow: TextOverflow.ellipsis,),),),
                GridColumn(columnName: 'comment',
                  label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text('Comment',overflow: TextOverflow.ellipsis,),),),
              ],),
            ),
          ],
        ),
      ),);
  }
  List<Sales> getSalesData(){
    return[
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,02,2023) ),
      Sales('Airline', 155, 'in progress', 'Expense from my business trip', DateTime(03,02,2023) ),
      Sales('Shuttle', 50, 'Reimbursed', 'Expense from my business trip', DateTime(03,02,2023) ),
      Sales('Parking', 26, 'Reimbursed', 'Expense from my business trip', DateTime(03,02,2023) ),
      Sales('Shuttle', 23, 'in progress', 'Expense from my business trip', DateTime(03,02,2023) ),
      Sales('Taxi', 145, 'Reimbursed', 'Expense from my business trip', DateTime(03,04,2023)),
      Sales('Rental car', 300, 'Reimbursed', 'Expense from my business trip', DateTime(03,04,2023) ),
      Sales('Airline', 145, 'new', 'Expense from my business trip', DateTime(03,04,2023) ),
      Sales('Hotel', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,04,2023)),
      Sales('Breakfast', 61, 'Reimbursed', 'Expense from my business trip', DateTime(03,04,2023) ),
      Sales('Electronics', 50, 'Reimbursed', 'Expense from my business trip', DateTime(03,04,2023) ),
      Sales('Fast food', 30, 'Reimbursed', 'Expense from my business trip',DateTime(03,03,2023) ),
      Sales('Office Supply', 100, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Parking', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Restaurant', 140, 'in progress', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Electronics', 50, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Shuttle ', 200, 'new', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Ride Sharing', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,03,2023) ),
      Sales('Electronics', 200, 'new', 'Expense from my business trip', DateTime(03,05,2023) ),
      Sales('Airline', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,05,2023) ),
      Sales('Taxi', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,05,2023) ),
      Sales('Electronics', 200, 'new', 'Expense from my business trip', DateTime(03,05,2023) ),
      Sales('Parking', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,05,2023) ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', DateTime(03,08,2023)),
      Sales('Restaurant', 200, 'in progress', 'Expense from my business trip', DateTime(03,08,2023) ),
      Sales('Ride Sharing', 200, 'in progress', 'Expense from my business trip', DateTime(03,08,2023) ),

    ];
  }
}

