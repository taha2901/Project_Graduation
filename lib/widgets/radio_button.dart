import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedRadio = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Radio(
            value: 'Option 1',
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value.toString();
              });
            },
          ),
          const Text('قبل الوجبه'),
          const SizedBox(
            width: 45,
          ),
          Radio(
            value: 'Option 2',
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value.toString();
              });
            },
          ),
          const Text('بعد الوجبه'),
        ],
      ),
    );
  }
}
