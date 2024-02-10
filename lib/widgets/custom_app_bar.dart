import 'package:diabetes/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, required this.icon,
  });
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomIcon(icon: icon,color: Colors.black,),
        Text(
          title,
          style:const TextStyle(
            fontSize: 28,
          ),
        ),
        
      ],
    );
  }
}
