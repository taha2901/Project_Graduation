import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:diabetes/widgets/notification_details.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 130),
            child: Icon(Icons.notifications),
          ),
          Text("الاشعارات"),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 130),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: CustomTextField(
              centerTitle: true,
              fillColor: Colors.white,
              hint: "بحث",
            ),
          )),
          SliverToBoxAdapter(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const NotificationDetials(),
              itemCount: 10,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
