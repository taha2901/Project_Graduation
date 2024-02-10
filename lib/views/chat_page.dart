import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/models/message.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
  static String id = 'ChatPage';
}

class _ChatPageState extends State<ChatPage> {
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KmessageCollection);

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    TextEditingController Controller = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KcreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: KprimaryColor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text('Chat'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleMyFriend(message: messagesList[index]);

                      // return ChatBuble(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomTextField(
                    controller: Controller,
                    onSubmitted: (data) {
                      messages.add({
                        Kmessage: data,
                        KcreatedAt: DateTime.now(),
                        'id': email,
                      });
                      Controller.clear();
                      _controller.animateTo(
                        0,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    suffixIcon: Icons.send,
                    hint: "Send Message",
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Lopading....');
        }
      },
    );
  }
}
