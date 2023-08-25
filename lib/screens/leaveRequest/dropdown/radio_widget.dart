import 'package:flutter/material.dart';

class RadioButtonsWidget extends StatefulWidget {
  const RadioButtonsWidget({super.key});

  @override
  _RadioButtonsWidgetState createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: 1,
            groupValue: selectedOption,
            onChanged: (value) => setState(() => selectedOption = value!),
            title: const Text('Full Day', style: TextStyle(fontSize: 14)),
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 2,
            groupValue: selectedOption,
            onChanged: (value) => setState(() => selectedOption = value!),
            title: const Text('Half Day', style: TextStyle(fontSize: 14)),
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 3,
            groupValue: selectedOption,
            onChanged: (value) => setState(() => selectedOption = value!),
            title: const Text('Custom', style: TextStyle(fontSize: 14)),
          ),
        ),
      ],
    );
  }
}
