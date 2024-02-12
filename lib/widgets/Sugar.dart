import 'package:diabetes/widgets/Chart.dart';
import 'package:diabetes/widgets/Warinig.dart';
import 'package:diabetes/widgets/easy_infinite_time_lines1.dart';
import 'package:flutter/material.dart';

class Sugar extends StatelessWidget {
  const Sugar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const MyTimeLineCalender1(),
        Warning('assets/images/img_3.png',
            "بدا انتظامك يقل اليوم عبدالرحم يجب ان تحافظ علي صحتك و علي مستوي سكرك "),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("قبل الوجبه"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Text("بعد الوجبه"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: chart(0, 10, 40, 145, "اليوم", "mg/dl"),
              ),
              const Text(
                "تفاصيل اخرى",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "يتم فيها اضافه كل التفاصيل المدخله بمعنى قام المستخدم بإدخال قياس السكر قبل الغداء وكانت النسبه 120 تعرض هذه التفاصيل كلها وعدد المرات التى قام المريض بقياس السكر فيها ")
            ],
          ),
        ),
      ],
    );
  }
}
