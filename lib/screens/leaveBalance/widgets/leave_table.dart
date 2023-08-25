import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:leaveapp/constants/global_variables.dart';
import 'package:leaveapp/controllers/leave_details_controller.dart';
import 'package:leaveapp/screens/leaveBalance/widgets/table_data_helper.dart';

class LeaveTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leaveDetailsController = Get.find<LeaveDetailsController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        final leaveDetails = leaveDetailsController.leaveDetails.value;

        if (leaveDetails == null || leaveDetails.data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: DataTable(
            headingRowHeight: 30.0,
            headingRowColor: MaterialStateProperty.all(Colors.black),
            dataRowColor:
                MaterialStateProperty.all(GlobalVariables.backgroundColor),
            columns: TableDataHelper.kTableColumnsList.getRange(0, 5).map((e) {
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
            rows: leaveDetails.data!.map((leaveEntry) {
              final startDateFormatted = DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(leaveEntry.startDate ?? ''));
              final endDateFormatted = DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(leaveEntry.endDate ?? ''));

              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[0].width,
                    child: Text(leaveEntry.leaveType ?? ''),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[1].width,
                    child: Text(startDateFormatted),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[2].width,
                    child: Text(endDateFormatted),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[3].width,
                    child: Text(leaveEntry.totalLeaveDatetime ?? ''),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[4].width,
                    child: Text(leaveEntry.status ?? ''),
                  ),
                ),
              ]);
            }).toList(),
          ),
        );
      }),
    );
  }
}
