import 'package:flutter/material.dart';
class DoctorCardFavourite extends StatelessWidget {
  const DoctorCardFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset('assets/images/DoctorSaied.png',
              height: 80,width: 154,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 80,
            width: 154,
            decoration:const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)
              )
            ),
            child:const Padding(
              padding:  EdgeInsets.only(right: 8,left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("دكتور صفاء محمد"),
                  Row(children: [
                    Text("نساء وتوليد"),
                    Padding(
                        padding: EdgeInsets.only(right: 50)),
                    Icon(Icons.star_border)
                  ],)
                ],
              ),
            ),
          )
        ],
      ),
    );
  
  }
}
