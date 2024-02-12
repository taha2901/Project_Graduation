// import 'package:flutter/material.dart';

// class CustomTextField extends StatefulWidget {
//    CustomTextField({
//     Key? key,
//     this.hint,
//     this.onChange,
//     this.obscure = false,
//     this.inputType,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.suffixPressed,
//     this.ispassword,
//     bool? isPassword,
//     TextInputType? type,
//     this.fillColor,
//     this.showBorder = true,
//     this.prefixText,
//     this.onSubmitted,
//     this.controller, 
//     this.prefixtext,
//     this.suffixtext,
//      this.centerTitle=false,
//   }) : super(key: key);

//   final bool showBorder;
//   final Color? fillColor;
//   final String? hint;
//   final String? prefixText;
//   final Function(String)? onChange;
//   final Function(String)? onSubmitted;
//   final bool? obscure;
//   final TextInputType? inputType;
//   // final IconData? prefixIcon;
//   final Widget? prefixIcon;
//   final IconData? suffixIcon;
//   final VoidCallback? suffixPressed;
//   final bool? ispassword;
//   final TextEditingController? controller; 
//    String? suffixtext;
//    String? prefixtext;
//    bool? centerTitle;

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: TextFormField(
//         textAlignVertical: TextAlignVertical.center,
//         textAlign: TextAlign.end,
//         controller: widget.controller,
//         onTap: widget.suffixPressed,
//         obscureText: widget.obscure!,
//         keyboardType: widget.inputType,
//         validator: (data) {
//           if (data!.isEmpty) {
//             return "Value Is Wrong";
//           }
//         },
//         onChanged: widget.onChange,
//         onFieldSubmitted: widget.onSubmitted,
//         decoration: InputDecoration(
//           filled: true,
//           // fillColor: widget.fillColor,
//           fillColor: Theme.of(context).colorScheme.secondary,
//           hintText:widget.hint,
//           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
//           prefixText: widget.prefixText,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 50),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
//           ),
//            focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
//           ),
          
//           border: widget.showBorder
//               ? OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 )
//               : InputBorder.none,
//           prefixIcon:
//               widget.prefixIcon != null ? widget.prefixIcon : null,
//           suffixIcon:
//               widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
              
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.hint,
    this.onChange,
    this.obscure = false,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    bool? isPassword,
    TextInputType? type,
    this.fillColor,
    this.showBorder = true,
    this.prefixText,
    this.onSubmitted,
    this.controller, 
    this.prefixtext,
    this.suffixtext,
    this.centerTitle=false,
    this.dropdownItems,
    this.onDropdownChanged,
  }) : super(key: key);

  final bool showBorder;
  final Color? fillColor;
  final String? hint;
  final String? prefixText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool? obscure;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool? ispassword;
  final TextEditingController? controller; 
  String? suffixtext;
  String? prefixtext;
  bool? centerTitle;
  final List<String>? dropdownItems;
  final void Function(String?)? onDropdownChanged; // اجعل الوسيط ودالته اختياريين

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.end,
        controller: widget.controller,
        onTap: widget.suffixPressed,
        obscureText: widget.obscure!,
        keyboardType: widget.inputType,
        validator: (data) {
          if (data!.isEmpty) {
            return "Value Is Wrong";
          }
        },
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          prefixText: widget.prefixText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          ),
          border: widget.showBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
              : InputBorder.none,
          prefixIcon: widget.prefixIcon != null ? widget.prefixIcon : null,
          suffixIcon: widget.dropdownItems != null ? DropdownButton( // استخدام drop-down button إذا كانت هناك قائمة منسدلة
            onChanged: widget.onDropdownChanged, // لاحظ التغيير هنا
            items: widget.dropdownItems!.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: widget.suffixtext,
          ) : (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
        ),
      ),
    );
  }
}
