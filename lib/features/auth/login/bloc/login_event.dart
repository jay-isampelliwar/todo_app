part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginSignUpNavigateActionEvent extends LoginEvent {}

class LoginLoginButtonClickedActionEvent extends LoginEvent {}

class LoginPasswordShowButtonEvent extends LoginEvent {}

class LoginPasswordHideButtonEvent extends LoginEvent {}
