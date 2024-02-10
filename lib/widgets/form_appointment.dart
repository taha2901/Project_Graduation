
import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_text_field_center_text.dart';
import 'package:diabetes/widgets/show_date_picker.dart';
import 'package:flutter/material.dart';

class FormOfAppointmentMedicine extends StatelessWidget {
  const FormOfAppointmentMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomTextFieldCenterlable(
          showBorder: false,
          hint: 'ابحث عن الدواء',
          suffixIcon: Icons.search,
        ),
        const SizedBox(
          height: 32,
        ),
        const Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('الكميه'),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldCenterlable(
                    showBorder: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Text('الجرعه'),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldCenterlable(showBorder: false),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('التردد'),
        const SizedBox(
          height: 16,
        ),
        MyDatePickerScreen(),
        const SizedBox(
          height: 16,
        ),
        const Text('الوقت'),
        const Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldCenterlable(
                    showBorder: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldCenterlable(showBorder: false),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        CustomButton(
          text: 'إضافه',
          icon: Icons.add,
          color: Colors.black,
          textcolor: Colors.white,
          circular: 10,
        ),
      ],
    );
  }
}
