import 'package:diabetes/models/message.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ChatBuble extends StatelessWidget {
   const ChatBuble({
    Key? key, required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
        margin:const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        decoration:const BoxDecoration(
            color: KprimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child:  Text(
          message.message,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



class ChatBubleMyFriend extends StatelessWidget {
   const ChatBubleMyFriend({
    Key? key, required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
        margin:const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        decoration:const BoxDecoration(
            color: Color(0xff006386),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Text(
          message.message,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

