part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginSignUpNavigateActionEvent extends LoginEvent {}

class LoginLoginButtonClickedActionEvent extends LoginEvent {
  String email;
  String password;
  LoginLoginButtonClickedActionEvent(
      {required this.email, required this.password});
}

class LoginForgetPasswordActionEvent extends LoginEvent {
  String password;
  String email;
  LoginForgetPasswordActionEvent({required this.password, required this.email});
}

class LoginPasswordShowButtonEvent extends LoginEvent {}

class LoginPasswordHideButtonEvent extends LoginEvent {}
