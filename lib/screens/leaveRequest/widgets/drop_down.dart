import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final double width;
  final double fontSize; // New font size parameter

  const CustomDropdown({
    Key? key,
    required this.dropdownItems,
    required this.width,
    required this.fontSize,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        hint: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Select an option'),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        icon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Transform.rotate(
            angle: -90 * (pi / 180),
            child: const Icon(CupertinoIcons.back),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value;
          });
        },
        items: widget.dropdownItems.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: widget.fontSize), // Set font size
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
