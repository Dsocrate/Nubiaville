import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Sales> _sales;
  late SalesDataSource _salesDataSource;

  @override
  void initState(){
    _sales = getSalesData();
    _salesDataSource = SalesDataSource(_sales);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Expense Manager'),
          actions: [
            GestureDetector(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                ),
                child: Text('INFO',
                style: TextStyle(
                  color: Colors.blue
                ),),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey
                ),
                child: Text('LOG OUT',
                  style: TextStyle(
                      color: Colors.blue
                  ),),
              ),
            )

          ],
        ),
        body: SfDataGrid(source: _salesDataSource,
        selectionMode: SelectionMode.multiple,
        allowSorting: true,

        columns: [
          GridTextColumn(columnName: 'date',
              label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
              child: Text('Dates',overflow: TextOverflow.ellipsis,),),),
          GridTextColumn(columnName: 'merchant',
            label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: Text('Merchants',overflow: TextOverflow.ellipsis,),),),
          GridTextColumn(columnName: 'total',
            label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: Text('Total',overflow: TextOverflow.ellipsis,),),),
          GridTextColumn(columnName: 'status',
            label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: Text('Status',overflow: TextOverflow.ellipsis,),),),
          GridTextColumn(columnName: 'comment',
            label: Container(padding:EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: Text('Comment',overflow: TextOverflow.ellipsis,),),),
        ],),
      ),);
  }
  List<Sales> getSalesData(){
    return[
      Sales('Electronics', 200.00, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Airline', 155.31, 'in progress', 'Expense from my business trip', 03/08/2023 ),
      Sales('Shuttle', 50.45, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Parking', 26.75, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Shuttle', 23.54, 'in progress', 'Expense from my business trip', 03/08/2023 ),
      Sales('Taxi', 145.42, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Rental car', 300.45, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Airline', 145.55, 'new', 'Expense from my business trip', 03/08/2023 ),
      Sales('Hotel', 200, 'Reimbursed', 'Expense from my business trip', 03/08/2023 ),
      Sales('Breakfast', 61.61, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Electronics', 50.66, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Fast food', 30.45, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Office Supply', 100.50, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Parking', 200.00, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Restaurant', 200.00, 'in progress', 'Expense from my business trip', 03/05/2023 ),
      Sales('Electronics', 50.33, 'Reimbursed', 'Expense from my business trip', 03/05/2023 ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', 03/04/2023 ),
      Sales('Shuttle ', 200, 'new', 'Expense from my business trip', 03/04/2023 ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', 03/04/2023 ),
      Sales('Ride Sharing', 200, 'Reimbursed', 'Expense from my business trip', 03/04/2023 ),
      Sales('Electronics', 200, 'new', 'Expense from my business trip', 03/03/2023 ),
      Sales('Airline', 200, 'Reimbursed', 'Expense from my business trip', 03/03/2023 ),
      Sales('Taxi', 200, 'Reimbursed', 'Expense from my business trip', 03/03/2023 ),
      Sales('Electronics', 200, 'new', 'Expense from my business trip', 03/03/2023 ),
      Sales('Parking', 200, 'Reimbursed', 'Expense from my business trip', 03/03/2023 ),
      Sales('Electronics', 200, 'Reimbursed', 'Expense from my business trip', 03/03/2023 ),
      Sales('Restaurant', 200, 'in progress', 'Expense from my business trip', 03/03/2023 ),
      Sales('Ride Sharing', 200, 'in progress', 'Expense from my business trip', 03/03/2023 ),

    ];
  }
}

class SalesDataSource extends DataGridSource{
  SalesDataSource(List<Sales> sales){
    dataGridRows = sales
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'date', value: dataGridRow.date),
      DataGridCell<String>(columnName: 'merchant', value: dataGridRow.merchant),
      DataGridCell<double>(columnName: 'total', value: dataGridRow.total),
      DataGridCell<String>(columnName: 'status', value: dataGridRow.status),
      DataGridCell<String>(columnName: 'comment', value: dataGridRow.comment)

    ])).toList();
  }
  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row){
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: (dataGridCell.columnName == 'total') ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(dataGridCell.value.toString(),
        overflow: TextOverflow.ellipsis,),
      );
    }).toList());
  }
}
class Sales{
  // constructor
  Sales(this.merchant, this.total, this.status, this.comment, this.date);
  final String merchant;
  final String comment;
  final double total;
  final String status;
  var date;
}
