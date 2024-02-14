import 'package:diabetes/views/Activities.dart';
import 'package:diabetes/views/add_appointments.dart';
import 'package:diabetes/views/barcode.dart';
import 'package:diabetes/views/home_page.dart';
import 'package:diabetes/views/my_bot.dart';
import 'package:diabetes/views/social_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  static String id = 'BottomNavBar';
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(child: Text('Selected Index: $_selectedIndex'));

    if (_selectedIndex == 0) {
      body = const HomePage();
    } else if (_selectedIndex == 1) {
      body = const Activities();
    } else if (_selectedIndex == 2) {
      body = const SocialScreen();
    } else if (_selectedIndex == 3) {
      body = const AddAppointments();
    } else if (_selectedIndex == 4) {
      body = const MyBot();
    } else if (_selectedIndex == 5) {
      body = Barcode();
    }
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسيه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: 'الأنشطه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.social_distance_outlined),
            label: 'مجتمع',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'مواعيد',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wechat),
            label: 'جلوكو بوت',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.barcode_reader),
            label: 'باركود',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
