import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaveapp/common/widgets/custom_button.dart';
import 'package:leaveapp/constants/global_variables.dart';
import 'package:leaveapp/screens/leaveRequest/dropdown/date_picker.dart';
import 'package:leaveapp/screens/leaveRequest/dropdown/drop_down.dart';
import 'package:leaveapp/screens/leaveRequest/dropdown/radio_widget.dart';
import 'package:leaveapp/screens/leaveRequest/dropdown/text_form_field.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  // Move the list declarations here
  List<String> list = <String>[
    'Permission',
    'Compensatory Off',
    'Earned Leave',
    'Sick/Casual Leave (SL/CL)'
  ];

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
              CustomDropdown(dropdownItems: list),
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
                height: 20,
              ),
              const RadioButtonsWidget(),
              const SizedBox(
                height: 20,
              ),
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
                height: 20,
              ),
              CustomDropdown(dropdownItems: list2),
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
              CustomTextField(),
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
                    onTap: () {},
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
}
