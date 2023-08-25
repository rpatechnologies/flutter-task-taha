import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaveapp/controllers/leave_balance_controller.dart';

class LeaveTypes extends StatelessWidget {
  final String text;

  const LeaveTypes({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeaveBalanceController _leaveBalanceController =
        Get.find<LeaveBalanceController>();

    return Obx(() {
      final leaveBalance = _leaveBalanceController.leaveBalance;

      final numValue = (leaveBalance[text] ?? 0).toDouble();

      return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey, // Set the line color
              width: 0.3, // Set the line width
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10.0).copyWith(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                numValue.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    });
  }
}
