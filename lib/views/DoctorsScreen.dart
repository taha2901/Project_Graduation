import 'package:diabetes/widgets/BarApp.dart';
import 'package:diabetes/widgets/DoctorList.dart';
import 'package:diabetes/widgets/custom_text_field_center_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            BarApp(),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomTextFieldCenterlable(
                  hint: 'بحث',
                  suffixIcon: FontAwesomeIcons.search,
                  prefixIcon: FontAwesomeIcons.fileContract,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                )
              ),
              SliverToBoxAdapter(
                child: Text(
                  "الاقرب",
                  textAlign: TextAlign.end,
                ),
              ),
              SliverToBoxAdapter(
                child: DoctorList(),
              ),
            ],
          ),
        ));
  }
}
