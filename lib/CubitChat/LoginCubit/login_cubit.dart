import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginuser({required String email, pass}) async {
    emit(LoginLoadin());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(LoginFailur());
      } else if (ex.code == 'email-already-in-use') {
        emit(LoginFailur());
      }
    } on Exception catch (e) {
      emit(LoginFailur());
    }
  }
}
