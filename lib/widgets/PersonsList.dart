import 'package:flutter/material.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 27,
                      child: Image.asset('assets/images/Ellipse 4.jpg'),
                    ),
                  ),
                ),
                const Text("محمد")
              ],
            ),
          ),
        itemCount: 20,
      ),
    );
  }
}
