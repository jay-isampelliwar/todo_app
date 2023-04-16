part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

abstract class SignUpActionState extends SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpButtonLoadingState extends SignUpState {}

class SignUpPasswordShowButtonClickedState extends SignUpState {}

class SignUpPasswordHideButtonClickedState extends SignUpState {}

class SignUpHomePageNavigatorActionState extends SignUpActionState {
  String message;
  SignUpHomePageNavigatorActionState({
    required this.message,
  });
}

class SignUpLoginNavigatorActionState extends SignUpActionState {}

class SignUpErrorState extends SignUpActionState {
  String message;
  SignUpErrorState({
    required this.message,
  });
}
