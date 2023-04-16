part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginActionState {
  String message;
  LoginErrorState({required this.message});
}

class LoginSignUpNavigateActionState extends LoginActionState {}

class LoginHomePageNavigateActionState extends LoginActionState {
  String message;
  LoginHomePageNavigateActionState({required this.message});
}

class LoginPasswordShowState extends LoginState {}

class LoginPasswordHideState extends LoginState {}

class LoginLoginLoadingButtonState extends LoginState {}
