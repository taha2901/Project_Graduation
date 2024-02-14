import 'package:diabetes/models/person_models.dart';
import 'package:diabetes/widgets/person_card.dart';
import 'package:flutter/material.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({super.key});
  final List<PersonModel> personList = const [
    PersonModel(
      image: 'assets/images/DoctorAhmed.png',
      PersonName: 'Taha Hamada',
    ),
    PersonModel(
      image: 'assets/images/Ellipse 4.jpg',
      PersonName: 'abdo',
    ),
    PersonModel(
      image: 'assets/images/DoctorSaied.png',
      PersonName: 'Ahmed',
    ),
    PersonModel(
      image: 'assets/images/DoctorAhmed.png',
      PersonName: 'Taha',
    ),
    PersonModel(
      image: 'assets/images/Ellipse 4.jpg',
      PersonName: 'Abdelrahman',
    ),
    PersonModel(
      image: 'assets/images/DoctorSaied.png',
      PersonName: 'Ahmed',
    ),
    PersonModel(
      image: 'assets/images/DoctorAhmed.png',
      PersonName: 'Mohamed',
    ),
    PersonModel(
      image: 'assets/images/Ellipse 4.jpg',
      PersonName: 'raouf',
    ),
    PersonModel(
      image: 'assets/images/DoctorSaied.png',
      PersonName: 'Sobhy Sameh',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PersonCard(person: personList[index]),
        itemCount: personList.length,
      ),
    );
  }
}
