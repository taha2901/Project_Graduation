import 'package:diabetes/widgets/DoctorDetails.dart';
import 'package:flutter/material.dart';
class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemBuilder: (context,index){
          return const DoctorDetials();
        },
        itemCount: 5,
    );
  }
}
