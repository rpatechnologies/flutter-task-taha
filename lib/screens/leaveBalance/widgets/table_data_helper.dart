import 'package:leaveapp/screens/leaveBalance/widgets/table_columns.dart';

class TableDataHelper {
  static List<TableColumns> kTableColumnsList = [
    TableColumns(title: 'Leave Type', width: 80.0),
    TableColumns(title: 'Start Date', width: 80.0),
    TableColumns(title: 'End Date', width: 80.0),
    TableColumns(title: 'No of Days', width: 80.0),
    TableColumns(title: 'Status', width: 70.0),
  ];
}
