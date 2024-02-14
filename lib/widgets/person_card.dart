import 'package:diabetes/models/person_models.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.person,
  });
  final PersonModel person;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: AssetImage(person.image), fit: BoxFit.fill),
            ),
          ),
          Text(person.PersonName)
        ],
      ),
    );
  }
}
