import 'package:diabetes/widgets/AlertFirst.dart';
import 'package:diabetes/widgets/NumberOfSteps.dart';
import 'package:diabetes/widgets/Pressure.dart';
import 'package:diabetes/widgets/Weight.dart';
import 'package:flutter/material.dart';
class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("الانشطه"),
            centerTitle: true,
            leading: Icon(Icons.arrow_forward_ios),
            bottom: TabBar(
                dividerHeight: 5,
                indicatorWeight: 5,
                tabs: [
                  Tab(child: Text("سكر"),),
                  Tab(child: Text("ضغط"),),
                  Tab(child: Text("وزن"),),
                  Tab(child: Text("عدد الخطوات"),)
                ]),
          ),
          body: TabBarView(
              children: [
                AlertFirst(),
                Pressure(),
                Weight(),
                NumOfSteps()
                
              ]),
        ),
      ),
    );
  }
}
