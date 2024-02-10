import 'package:diabetes/widgets/define_doctor.dart';
import 'package:diabetes/widgets/form_reservation.dart';
import 'package:flutter/material.dart';

class ConfirmReservation extends StatelessWidget {
  const ConfirmReservation({super.key});
  static String id = 'confirmReservation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.delete),
        actions: const [
          Padding(
            padding:  EdgeInsets.only(right: 16),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const defineDoctor(),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
                height: 2,
                thickness: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              formReservation(),
            ],
          ),
        ),
      ),
    );
  }
}
