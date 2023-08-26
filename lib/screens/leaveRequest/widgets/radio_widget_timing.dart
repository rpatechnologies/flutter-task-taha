import 'package:flutter/material.dart';

class RadioButtonsTimingWidget extends StatefulWidget {
  const RadioButtonsTimingWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RadioButtonsTimingWidgetState createState() =>
      _RadioButtonsTimingWidgetState();
}

class _RadioButtonsTimingWidgetState extends State<RadioButtonsTimingWidget> {
  int selectedOption = 2;

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
              });
            },
            title: const Text('Fore Noon (FN)', style: TextStyle(fontSize: 14)),
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
              });
            },
            title:
                const Text('After Noon (AN)', style: TextStyle(fontSize: 14)),
            activeColor: Colors.amber, // Set the active color to yellow
          ),
        ),
      ],
    );
  }
}
