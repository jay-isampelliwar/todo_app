part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginState {
  String message;
  LoginErrorState({required this.message});
}

class LoginSignUpNavigateActionState extends LoginActionState {}

class LoginHomePageNavigateActionState extends LoginActionState {}

class LoginPasswordShowState extends LoginState {}

class LoginPasswordHideState extends LoginState {}

class LoginLoginLoadingButtonState extends LoginState {}
