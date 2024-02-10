import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_field_dropdown.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PartScreen extends StatefulWidget {

  @override
  State<PartScreen> createState() => _PartScreenState();
}

class _PartScreenState extends State<PartScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomTextField(),
            const CustomTextFieldDropdown(),
          ],
        ),
      ),
      Column(
        children: [
          CustomButton(
            text: 'حفظ',
            width: double.infinity,
            color: Colors.black,
            textcolor: Colors.white,
          ),
          const Text("أو"),
          CustomButton(
            text: 'بلوتوث',
            width: double.infinity,
            color: Colors.black,
            textcolor: Colors.white,
            icon: Icons.bluetooth,
          ),
        ],
      ),
    ]);
  }
}
