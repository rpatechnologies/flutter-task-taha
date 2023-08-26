import 'package:flutter/material.dart';

class RadioButtonsWidget extends StatefulWidget {
  final VoidCallback onFullDayOptionSelected;
  final VoidCallback onHalfDayOptionSelected;
  final VoidCallback onCustomOptionSelected;

  const RadioButtonsWidget({
    Key? key,
    required this.onFullDayOptionSelected,
    required this.onHalfDayOptionSelected,
    required this.onCustomOptionSelected,
  }) : super(key: key);

  @override
  _RadioButtonsWidgetState createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  int selectedOption = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: 1,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                widget.onFullDayOptionSelected(); // Call the callback
              });
            },
            title: const Text('Full Day', style: TextStyle(fontSize: 14)),
            activeColor: Colors.amber, // Set the active color to yellow
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 2,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                widget.onHalfDayOptionSelected(); // Call the callback
              });
            },
            title: const Text('Half Day', style: TextStyle(fontSize: 14)),
            activeColor: Colors.amber, // Set the active color to yellow
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 3,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                widget.onCustomOptionSelected(); // Call the callback
              });
            },
            title: const Text('Custom', style: TextStyle(fontSize: 14)),
            activeColor: Colors.amber, // Set the active color to yellow
          ),
        ),
      ],
    );
  }
}
