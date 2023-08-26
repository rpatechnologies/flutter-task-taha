import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: TextFormField(
          maxLines: 1,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            hintText: 'eg. 2',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
