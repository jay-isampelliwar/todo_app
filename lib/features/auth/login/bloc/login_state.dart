part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginActionState {
  String message;
  LoginErrorState({required this.message});
}

class LoginLoadingSuccessState extends LoginActionState {
  String message;
  LoginLoadingSuccessState({required this.message});
}

class LoginSignUpNavigateActionState extends LoginActionState {}

class LoginHomePageNavigateActionState extends LoginActionState {}

class LoginPasswordShowState extends LoginState {}

class LoginPasswordHideState extends LoginState {}

class LoginLoginLoadingButtonState extends LoginState {}
