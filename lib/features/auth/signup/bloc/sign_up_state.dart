part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

abstract class SignUpActionState extends SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpButtonLoadingState extends SignUpState {}

class SignUpPasswordShowButtonClickedState extends SignUpState {}

class SignUpHomePageNavigatorActionState extends SignUpActionState {}

class SignUpLoginNavigatorActionState extends SignUpActionState {}
