part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitial extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginSignUpNavigateActionState extends LoginActionState {}

class LoginButtonClickedActionState extends LoginActionState {}

class LoginPasswordShowState extends LoginState {}

class LoginPasswordHideState extends LoginState {}

class LoginLoginLoadingButtonState extends LoginState {}
