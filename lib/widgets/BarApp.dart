import 'package:diabetes/widgets/favourite_bool.dart';
import 'package:flutter/material.dart';

class BarApp extends StatefulWidget {
  const BarApp({Key? key}) : super(key: key);

  @override
  State<BarApp> createState() => _BarAppState();
}

bool isFavourite = false;

class _BarAppState extends State<BarApp> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FavouriteBool(),
        Text(
          "دكتور",
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 24,
            color: Color(0xFF0F1828),
          ),
        )
      ],
    );
  }
}
