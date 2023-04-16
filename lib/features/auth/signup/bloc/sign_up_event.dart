part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpButtonClickedEvent extends SignUpEvent {}

class SignUpLoginButtonClickedEvent extends SignUpEvent {}

class SignUpPasswordShowButtonClickedEvent extends SignUpEvent {}

//*==============================================

class SignUpLoginButtonClickedActionEvent extends SignUpEvent {}

class SignUpButtonClickedActionEvent extends SignUpEvent {
  String name;
  String phone;
  String email;
  String password;
  SignUpButtonClickedActionEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}
