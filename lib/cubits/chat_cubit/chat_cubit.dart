import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/constants/constant.dart';
import 'package:diabetes/models/message.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KmessageCollection);
  void sendMessage({required String msg, required String email}) {
    messages.add({
      Kmessage: msg,
      KcreatedAt: DateTime.now(),
      'id': email,
    });
  }

  void getMessages() {
    messages.orderBy(KcreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      print('success getMsg');
      emit(ChatSuccess(message: messageList));
    });
  }
}
