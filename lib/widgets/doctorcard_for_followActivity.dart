import 'package:flutter/material.dart';

class DoctorCardForFollow extends StatelessWidget {
  DoctorCardForFollow({
    Key? key,
    this.NameOfDoc,
    this.TypeOfDoc,
  }) : super(key: key);
  String? NameOfDoc;
  String? TypeOfDoc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 30),
      child: Column(
        children: [
          Image.asset(
            "assets/images/DoctorSaied.png",
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE7EEF2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      NameOfDoc!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      TypeOfDoc!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const Icon(
                      Icons.location_on_sharp,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
