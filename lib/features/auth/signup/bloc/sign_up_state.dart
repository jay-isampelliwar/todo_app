part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

abstract class SignUpActionState extends SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpButtonLoadingState extends SignUpState {}

class SignUpPasswordShowButtonClickedState extends SignUpState {}

class SignUpPasswordHideButtonClickedState extends SignUpState {}

class SignUpHomePageNavigatorActionState extends SignUpActionState {}

class SignUpLoginNavigatorActionState extends SignUpActionState {}

class SignUpShowSnackBarState extends SignUpActionState {
  String message;
  SignUpShowSnackBarState({
    required this.message,
  });
}
