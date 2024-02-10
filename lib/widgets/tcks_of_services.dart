
import 'package:diabetes/views/Doctor.dart';
import 'package:diabetes/views/glucose_measurement.dart';
import 'package:diabetes/widgets/service_of_follow_activities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicksOfServices extends StatelessWidget {
  const TicksOfServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Services(
            text: 'قياس السكر',
            icon: FontAwesomeIcons.hospital,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GlucoseMeasurement()),
              );
            },
          ),
        ),
        const SizedBox(
          width: 23,
        ),
        Expanded(
          child: Services(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Doctor()),
              );
            },
            text: 'دكتور',
            icon: FontAwesomeIcons.userDoctor,
          ),
        ),
        const SizedBox(
          width: 23,
        ),
        Expanded(
          child: Services(
            text: 'رياضه',
            icon: FontAwesomeIcons.running,
          ),
        ),
      ],
    );
  }
}
