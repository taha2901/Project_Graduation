import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:diabetes/widgets/custom_text_field_center_text.dart';
import 'package:diabetes/widgets/show_date_picker.dart';
import 'package:flutter/material.dart';

class FormOfAppointmentMedicine extends StatelessWidget {
  const FormOfAppointmentMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('الكميه'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      showBorder: false,
                      hint: '5.00 pm',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('الجرعه'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      showBorder: false,
                      hint: 'قرص واحد',
                    ),
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
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      showBorder: false,
                      hint: 'بعد الغذاء',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      showBorder: false,
                      hint: '10.00 am',
                    ),
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
      ),
    );
  }
}
