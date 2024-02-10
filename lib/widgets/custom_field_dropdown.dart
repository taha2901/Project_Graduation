import 'package:flutter/material.dart';

class CustomTextFieldDropdown extends StatefulWidget {
   const CustomTextFieldDropdown({Key? key}) : super(key: key);

  @override
  State<CustomTextFieldDropdown> createState() => _CustomTextFieldDropdownState();
}

class _CustomTextFieldDropdownState extends State<CustomTextFieldDropdown> {
  List dropdownlist=["فطار","غذاء","عشاء"];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12,right: 12,top: 9),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            disabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
        ),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),

          hint: const Text("اسم الوجبه"),
           value: selectedItem,
           items: dropdownlist.map((e){
             return DropdownMenuItem<String>(
               child: Text("$e"),
               value: e,
             );
           }).toList(),
            onChanged: (value){}),
      ),
    );
  }
}
