import 'package:diabetes/cubits/chat_cubit/chat_cubit.dart';
import 'package:diabetes/models/message.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constant.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  final _controller = ScrollController();
  static String id = 'ChatPage';
  TextEditingController Controller = TextEditingController();
  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.message;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    return messageList[index].id == email
                        ? ChatBuble(message: messageList[index])
                        : ChatBubleMyFriend(message: messageList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField(
              controller: Controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(msg: data, email: email);
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
  }
}
