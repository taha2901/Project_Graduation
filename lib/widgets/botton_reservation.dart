
import 'package:diabetes/widgets/confirm_reservation.dart';
import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ButtonsInReservation extends StatelessWidget {
  const ButtonsInReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIcon(
            icon: Icons.messenger_sharp,
            color: Colors.black.withOpacity(0.8),
            colorIcon: Colors.white,
            circular: 30,
          ),
          Expanded(
            child: CustomButton(
              text: 'تأكيد',
              circular: 5,
              color: Colors.black,
              textcolor: Colors.white,
              height: 50,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ConfirmReservation.id,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
