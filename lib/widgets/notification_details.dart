import 'package:flutter/material.dart';
class NotificationDetials extends StatelessWidget {
  const NotificationDetials({Key? key}) : super(key: key);
static String id = 'NotificationDetials';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding:  EdgeInsets.only(right: 10,left: 10,top: 15),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.notifications,size: 30,),
                  Column(children: [
                    Row(children: [
                      Text("دكتور على محمد"),
                      Padding(padding:EdgeInsets.only(right: 200) ),
                      Text("الثلاثاء"),
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("الدواء جاهز للاستلام"),
                        Padding(padding:EdgeInsets.only(right: 175) ),
                      Text("5 دقائق"),
                    ],)
                  ],
                  ),
                  ],),
              Divider(thickness: 3,),
            ],
          ),
        ),
      ),
    );
  }
}
