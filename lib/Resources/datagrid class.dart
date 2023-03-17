import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesDataSource extends DataGridSource{
  SalesDataSource(List sales){
    buildDataGridRow(sales);}
    void buildDataGridRow(List salesData){
    dataGridRow = salesData.map((sales){
      return DataGridRow(cells: [
      DataGridCell(columnName: 'date', value: sales.date),
      DataGridCell(columnName: 'merchant', value: sales.merchant),
      DataGridCell(columnName: 'total', value: sales.total),
      DataGridCell(columnName: 'status', value: sales.status),
      DataGridCell(columnName: 'comment', value: sales.comment)]);
    }).toList();
  }

  //List dataGridRow = [];

  late List<DataGridRow> dataGridRow;
  @override
  //List get row =&gt; dataGridRow.isEmpty ?[] : dataGridRow;
   //List get row => dataGridRow.isEmpty ? [] : dataGridRow;
 List<DataGridRow> get rows => dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row){
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell){
          return dataGridCell.columnName == 'date' ?
          Container(
            alignment: Alignment.center,
            child: Text(DateFormat('MM/dd/yyyy').format(dataGridCell.value)),
          ) : Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: (dataGridCell.columnName == 'total') ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(dataGridCell.value.toString(),
              //overflow: TextOverflow.ellipsis,
            ),
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
  late DateTime date;
}
