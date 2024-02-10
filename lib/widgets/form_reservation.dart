import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

Column formReservation() {
  return Column(
    children: [
      CustomTextField(
        hint: 'أدخل اسمك',
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(
                  hint: 'الجنس',
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(
                  hint: 'أدخل عمرك',
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      CustomTextField(
        hint: 'أدخل رقم تلفونك',
      ),
      const SizedBox(
        height: 32,
      ),
      CustomButton(
        text: 'التالي',
        color: Colors.black,
        height: 50,
        textcolor: Colors.white,
        circular: 10,
      ),
    ],
  );
}
