import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(1.0),
                hintText: 'HH',
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 20),
          ),
          Flexible(
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(1.0),
                hintText: 'MM',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: 'AM',
            onChanged: (newValue) {
              // Handle AM/PM selection
            },
            items: ['AM', 'PM']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
