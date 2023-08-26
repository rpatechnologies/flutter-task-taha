import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaveapp/common/widgets/custom_button.dart';
import 'package:leaveapp/constants/global_variables.dart';

import 'package:leaveapp/screens/leaveRequest/widgets/date_picker.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/drop_down.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/radio_widget.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/radio_widget_timing.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/text_field.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/text_form_field.dart';
import 'package:leaveapp/screens/leaveRequest/widgets/time_selector.dart';
import 'package:leaveapp/services/push_notification.dart';
import 'package:leaveapp/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  bool isFullDayOptionSelected = false;
  bool isCustomOptionSelected = true;
  bool isHalfDayOptionSelected = false;

  // Move the list declarations here
  List<String> list = <String>[
    'Permission',
    'Compensatory Off',
    'Earned Leave',
    'Sick/Casual Leave (SL/CL)'
  ];
  final CollectionReference postsRef =
      FirebaseFirestore.instance.collection('/test');

  List<String> list2 = <String>['raghu', 'victor', 'manoj', 'kartik'];

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
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: const Icon(
                CupertinoIcons.back,
                color:
                    Colors.black, // Set the desired color for the back button
              ),
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Leave Request',
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
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Leave type',
                    style: TextStyle(
                      color: GlobalVariables.blackText,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                dropdownItems: list,
                width: MediaQuery.of(context).size.width * 0.9,
                fontSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'No of Days',
                  style: TextStyle(
                    color: GlobalVariables.blackText,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RadioButtonsWidget(
                onFullDayOptionSelected: () {
                  setState(() {
                    isFullDayOptionSelected = true;
                    isHalfDayOptionSelected = false;
                    isCustomOptionSelected = false;
                    print('1');
                  });
                },
                onHalfDayOptionSelected: () {
                  setState(() {
                    isFullDayOptionSelected = false;
                    isHalfDayOptionSelected = true;
                    isCustomOptionSelected = false;
                    print('2');
                  });
                },
                onCustomOptionSelected: () {
                  setState(() {
                    isFullDayOptionSelected = false;
                    isHalfDayOptionSelected = false;
                    isCustomOptionSelected = true;
                    print('3');
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isFullDayOptionSelected,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notify to',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropdown(
                      dropdownItems: list2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reason',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextFormField(),
                  ],
                ),
              ),
              Visibility(
                visible: isHalfDayOptionSelected,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Time',
                                style: TextStyle(
                                  color: GlobalVariables.blackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TimeSelector()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Time',
                                style: TextStyle(
                                  color: GlobalVariables.blackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TimeSelector()
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Timing',
                            style: TextStyle(
                              color: GlobalVariables.blackText,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RadioButtonsTimingWidget()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notify to',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropdown(
                      dropdownItems: list2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reason',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextFormField(),
                  ],
                ),
              ),
              Visibility(
                visible: isCustomOptionSelected,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Start Date',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'End Date',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Notify to',
                                style: TextStyle(
                                  color: GlobalVariables.blackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomDropdown(
                                dropdownItems: list2,
                                width: MediaQuery.of(context).size.width * 0.55,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Days',
                                style: TextStyle(
                                  color: GlobalVariables.blackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField()
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reason',
                        style: TextStyle(
                          color: GlobalVariables.blackText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextFormField(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {},
                    text: 'Cancel',
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomButton(
                    onTap: () {
                      sendData();
                      print("requested for leave");
                    },
                    text: 'Request leave',
                    color: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendData() async {
    var data = await postsRef.doc("plipl001").get();
    var DocData = data.data();
    // print("data is ${(DocData as Map)['device_id']}");
    PushNotifications.sendPushNotification(
        (DocData as Map)['device_id'], "Test", "Test");
  }
}
