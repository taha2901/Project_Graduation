import 'package:diabetes/page/Home.dart';
import 'package:diabetes/theme/light_theme.dart';
import 'package:diabetes/views/DoctorReservation.dart';
import 'package:diabetes/views/add_appointments.dart';
import 'package:diabetes/views/add_person.dart';
import 'package:diabetes/views/chat_page.dart';
import 'package:diabetes/views/home_page.dart';
import 'package:diabetes/views/login.dart';
import 'package:diabetes/views/medical_recoer.dart';
import 'package:diabetes/views/modify_personal_detail.dart';
import 'package:diabetes/views/pageview.dart';
import 'package:diabetes/views/store_favourite.dart';
import 'package:diabetes/widgets/confirm_reservation.dart';
import 'package:diabetes/widgets/notification_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        AddPerson.id: (context) => const AddPerson(),
        DoctorReservation.id: (context) => const DoctorReservation(),
        ConfirmReservation.id: (context) => const ConfirmReservation(),
        Home.id: (context) => const Home(),
        ScreenOfPageView.id: (context) => PageView(),
        ChatPage.id: (context) => ChatPage(),
        AddPerson.id: (context) => const AddPerson(),
        HomePage.id: (context) {
          return HomePage(
              userEmaill: ModalRoute.of(context)!.settings.arguments as String);
        },
        PersonalDetails.id: (context) => const PersonalDetails(),
        MedicalRecords.id: (context) => const MedicalRecords(),
        NotificationDetials.id: (context) => const NotificationDetials(),
        StoreFavourities.id: (context) => const StoreFavourities(),
        AddAppointments.id: (context) => const AddAppointments(),
      },
      debugShowCheckedModeBanner: false,
      home: ScreenOfPageView(),
    );
  }
}
