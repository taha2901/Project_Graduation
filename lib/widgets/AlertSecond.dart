import 'package:diabetes/widgets/Chart.dart';
import 'package:diabetes/widgets/Warinig.dart';
import 'package:flutter/material.dart';
class AlertSecond extends StatelessWidget {
  const AlertSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView(
        children: [
          Warning('assets/images/img_5.png', "يوم رائع عبدالرحمن يوجد تحسن في مستوي السكر لديك وصل في اخذ الادويه و عمل بعض الانشطه "),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("قبل الوجبه"),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 5,
                      ),
                    ),
                    Padding(padding:EdgeInsets.only(right:50) ),
                    Text("بعد الوجبه"),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 5,
                      ),
                    ),
                  ],),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:chart(0, 10, 40, 145, "اليوم", "mg/dl"),
                ),
                Text("تفاصيل اخرى"),
                Text("يتم فيها اضافه كل التفاصيل المدخله بمعنى قام المستخدم بإدخال قياس السكر قبل الغداء وكانت النسبه 120 تعرض هذه التفاصيل كلها وعدد المرات التى قام المريض بقياس السكر فيها ")

              ],
            ),
          ),
        ],
      );
  }
}
