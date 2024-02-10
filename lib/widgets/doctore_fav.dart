import 'package:flutter/material.dart';

class DoctorFavourite extends StatelessWidget {
  const DoctorFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.asset(
              'assets/images/DoctorAhmed.png',
              // height: 90,
              // width: 105,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 90,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      const Text("دكتور على محمد"),
                      Container(
                        margin: const EdgeInsets.only(right: 90, left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Row(
                          children: [
                            Icon(Icons.star),
                            Text("4.1"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                      ),
                      Text("قلب واوعيه دمويه")
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        size: 20,
                      ),
                      Text("13-شارع خليل-المعادى")
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
