import 'package:diabetes/views/chat_page.dart';
import 'package:diabetes/views/profile_screen.dart';
import 'package:diabetes/widgets/custom_icon.dart';
import 'package:diabetes/widgets/custom_text_field_center_text.dart';
import 'package:diabetes/widgets/easy_infinite_time_lines1.dart';
import 'package:diabetes/widgets/tcks_of_services.dart';
import 'package:diabetes/widgets/ticks_of_best_doctors.dart';
import 'package:diabetes/widgets/ticks_of_heart.dart';
import 'package:diabetes/widgets/two_square_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
     this.userEmaill,
  });
  static String id = 'FollowActivities';

  final String? userEmaill;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var userEmail = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: CustomIcon(
            onTap: () {
              Navigator.pushNamed(context, ChatPage.id, arguments: userEmail);
            },
            icon: FontAwesomeIcons.facebookMessenger,
            color: Colors.black.withOpacity(0.1),
            colorIcon: Colors.black,
          ),
          actions: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'أهلا',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'طه حماده ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset('assets/images/Ellipse 4.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFieldCenterlable(
                hint: 'بحث',
                fillColor: Colors.white,
                prefixIcon: FontAwesomeIcons.bars,
                suffixIcon: Icons.search,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'تتبع الانشطه',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              MyTimeLineCalender1(),
              SizedBox(
                height: 24,
              ),
              TwoSquareContainer(),
              SizedBox(
                height: 24,
              ),
              TicksOfHeart(),
              SizedBox(
                height: 32,
              ),
              Text(
                'الخدمات',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              TicksOfServices(),
              SizedBox(
                height: 8,
              ),
              Text('أحسن الأطباء'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TicksOfBestDoctors(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
