import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String passWord}) async {
    emit(LoginLoaded());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);
          print('Success Login');
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailur(errMessage: 'No user found for that email.'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailur(errMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginFailur(errMessage: 'something went wrong'));
    }
  }


  Future<void> registerUser(
      {required String email, required String passWord}) async {
    emit(RegisterLoaded());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: passWord);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailur(errMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailur(
            errMessage: 'email already in use'));
      }
    } catch (e) {
      emit(RegisterFailur(errMessage: 'something went wrong'));
    }
  }
}
