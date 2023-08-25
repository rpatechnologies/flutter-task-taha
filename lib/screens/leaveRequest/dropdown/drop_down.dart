import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownItems;

  const CustomDropdown({Key? key, required this.dropdownItems})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Set your desired width
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Border color
        borderRadius: BorderRadius.circular(8.0), // Rounded corner radius
      ),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        hint: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Select an option'),
        ), // Hint text
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove the default border
        ),
        icon: Padding(
          padding:
              const EdgeInsets.only(right: 8.0), // Add padding to the right
          child: Transform.rotate(
            angle: -90 * (pi / 180),
            child: const Icon(CupertinoIcons.back),
          ), // Set the icon
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value;
          });
        },
        items:
            widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(value),
            ),
          );
        }).toList(),
        // Additional properties can be customized here
      ),
    );
  }
}
