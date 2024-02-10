import 'package:diabetes/widgets/doctorcard_for_followActivity.dart';
import 'package:flutter/material.dart';

class TicksOfBestDoctors extends StatelessWidget {
  const TicksOfBestDoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DoctorCardForFollow(
          NameOfDoc: "د مريم نعيم",
          TypeOfDoc: "16-شارع جمال عبدالناصر",
        ),
        DoctorCardForFollow(
          NameOfDoc: "د مريم نعيم",
          TypeOfDoc: "16-شارع جمال عبدالناصر",
        ),
        DoctorCardForFollow(
          NameOfDoc: "د مريم نعيم",
          TypeOfDoc: "16-شارع جمال عبدالناصر",
        ),
        DoctorCardForFollow(
          NameOfDoc: "د مريم نعيم",
          TypeOfDoc: "16-شارع جمال عبدالناصر",
        ),
      ],
    );
  }
}
