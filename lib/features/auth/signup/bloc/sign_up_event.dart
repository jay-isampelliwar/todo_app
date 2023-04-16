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
<<<<<<< HEAD
  String phone;
  String email;
  String password;
  SignUpButtonClickedActionEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
=======
  String password;
  String email;
  String phone;

  SignUpButtonClickedActionEvent(
      {required this.name,
      required this.password,
      required this.phone,
      required this.email});
>>>>>>> 7ac6a43dbf1a9419fa88a657daf7690214d63101
}
