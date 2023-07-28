part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadin extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailur extends LoginState {}
