import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        maxLines: 6, // Set the maximum lines for the text field
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.all(16.0), // Padding inside the text field
          hintText: 'Enter your reason here', // Hint text
          border: InputBorder.none, // Remove the default border
        ),
      ),
    );
  }
}
