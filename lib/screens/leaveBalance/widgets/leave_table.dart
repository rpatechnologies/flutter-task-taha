import 'package:flutter/material.dart';
import 'package:leaveapp/constants/global_variables.dart';
import 'package:leaveapp/screens/leaveBalance/widgets/table_data_helper.dart';

class LeaveTable extends StatefulWidget {
  const LeaveTable({super.key});

  @override
  State<LeaveTable> createState() => _LeaveTableState();
}

class _LeaveTableState extends State<LeaveTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: DataTable(
          headingRowHeight: 30.0,
          headingRowColor: MaterialStateProperty.all(Colors.black),
          dataRowColor:
              MaterialStateProperty.all(GlobalVariables.backgroundColor),
          columns: TableDataHelper.kTableColumnsList
              .getRange(0, 5) // Get the first 5 columns
              .map((e) {
            return DataColumn(
              label: SizedBox(
                width: e.width ?? 0,
                child: Text(
                  e.title ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }).toList(),
          rows: List.generate(100, (index) {
            return DataRow(cells: [
              DataCell(
                SizedBox(
                  width: TableDataHelper.kTableColumnsList[0].width,
                  child: const Text('SL'),
                ),
              ),
              DataCell(
                SizedBox(
                  width: TableDataHelper.kTableColumnsList[1].width,
                  child: const Text('30/07/2023'),
                ),
              ),
              DataCell(
                SizedBox(
                  width: TableDataHelper.kTableColumnsList[2].width,
                  child: const Text('04/08/2023'),
                ),
              ),
              DataCell(
                SizedBox(
                  width: TableDataHelper.kTableColumnsList[3].width,
                  child: Text('${index + 1}'),
                ),
              ),
              DataCell(
                SizedBox(
                  width: TableDataHelper.kTableColumnsList[4].width,
                  child: const Text('Approved'),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
