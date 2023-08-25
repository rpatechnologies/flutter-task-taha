import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaveapp/common/widgets/custom_button.dart';
import 'package:leaveapp/constants/global_variables.dart';
import 'package:leaveapp/controllers/leave_balance_controller.dart';
import 'package:leaveapp/screens/leaveBalance/widgets/leave_table.dart';
import 'package:leaveapp/screens/leaveBalance/widgets/leave_types.dart';
import 'package:leaveapp/screens/leaveRequest/leave_request.dart';

class LeaveBalanceScreen extends StatefulWidget {
  const LeaveBalanceScreen({super.key});

  @override
  State<LeaveBalanceScreen> createState() => _LeaveBalanceScreenState();
}

class _LeaveBalanceScreenState extends State<LeaveBalanceScreen> {
  final LeaveBalanceController _leaveBalanceController =
      Get.put(LeaveBalanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Leave Balance',
                style: TextStyle(
                  color: GlobalVariables.blackText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 0.5, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'FY 2023-24',
                            style: TextStyle(
                              color: GlobalVariables.blackText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Transform.rotate(
                            angle: -90 * (pi / 180),
                            child: const Icon(CupertinoIcons.back),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Leave Policy',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Leave Balance',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeaveRequestScreen()),
                      );
                    },
                    text: 'Apply Leave',
                    color: Colors.amber,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      LeaveTypes(
                        text: 'Sick Leave',
                      ),
                      LeaveTypes(
                        text: 'Casual Leave',
                      ),
                      LeaveTypes(
                        text: 'Earned Leave',
                      ),
                      LeaveTypes(
                        text: 'Compensatory Off',
                      ),
                      LeaveTypes(
                        text: 'On Duty',
                      ),
                      LeaveTypes(
                        text: 'Work From Home',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Leave Availed',
                  style: TextStyle(
                    color: GlobalVariables.blackText,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      LeaveTypes(
                        text: 'Sick Leave',
                      ),
                      LeaveTypes(
                        text: 'Casual Leave',
                      ),
                      LeaveTypes(
                        text: 'Earned Leave',
                      ),
                      LeaveTypes(
                        text: 'Compensatory Off',
                      ),
                      LeaveTypes(
                        text: 'On Duty',
                      ),
                      LeaveTypes(
                        text: 'Work From Home',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Leave History',
                  style: TextStyle(
                    color: GlobalVariables.blackText,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      alignment: Alignment.centerLeft,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 1,
                        child: TextFormField(
                          // onFieldSubmitted: navigateToSearchScreen,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                              top: 10,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SingleChildScrollView(child: LeaveTable()),
            ],
          ),
        ),
      ),
    );
  }
}
