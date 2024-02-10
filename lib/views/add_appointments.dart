import 'package:diabetes/widgets/form_appointment.dart';
import 'package:flutter/material.dart';


class AddAppointments extends StatelessWidget {
  const AddAppointments({super.key});
static String id = 'AddAppointments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('مواعيد الأدويه'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: FormOfAppointmentMedicine(),
      ),
    );
  }
}
