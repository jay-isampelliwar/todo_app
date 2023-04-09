import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);

    on<SignUpButtonClickedActionEvent>(signUpButtonClickedActionEvent);
    on<SignUpLoginButtonClickedActionEvent>(
        signUpLoginButtonClickedActionEvent);
    on<SignUpPasswordShowButtonClickedEvent>(
        signUpPasswordShowButtonClickedEvent);
  }

  FutureOr<void> signUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {}

  // FutureOr<void> signUpButtonClickedEvent(
  //     SignUpButtonClickedEvent event, Emitter<SignUpState> emit) {
  //   //!API Call

  // }

  FutureOr<void> signUpButtonClickedActionEvent(
      SignUpButtonClickedActionEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpButtonLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(SignUpHomePageNavigatorActionState());
  }

  FutureOr<void> signUpLoginButtonClickedActionEvent(
      SignUpLoginButtonClickedActionEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoginNavigatorActionState());
  }

  FutureOr<void> signUpPasswordShowButtonClickedEvent(
      SignUpPasswordShowButtonClickedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordShowButtonClickedState());
  }
}