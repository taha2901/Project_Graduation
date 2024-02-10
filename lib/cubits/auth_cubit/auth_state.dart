part of 'auth_cubit.dart';

@immutable
class AuthState {}

class AuthInitial extends AuthState {}


class LoginLoaded extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailur extends AuthState {
  String errMessage;
  LoginFailur({required this.errMessage});
}


class RegisterLoaded extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailur extends AuthState {
  String errMessage;
  RegisterFailur({required this.errMessage});
}