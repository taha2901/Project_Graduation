part of 'chat_cubit.dart';

@immutable
class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<Message> message;
  ChatSuccess({required this.message});
}
