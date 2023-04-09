import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSignUpNavigateActionEvent>(loginSignUpNavigateActionEvent);
    on<LoginLoginButtonClickedActionEvent>(loginLoginButtonClickedActionEvent);
    on<LoginPasswordShowButtonEvent>(loginPasswordShowButtonEvent);
    on<LoginPasswordHideButtonEvent>(loginPasswordHideButtonEvent);
  }

  FutureOr<void> loginSignUpNavigateActionEvent(
      LoginSignUpNavigateActionEvent event, Emitter<LoginState> emit) {
    emit(LoginSignUpNavigateActionState());
  }

  FutureOr<void> loginLoginButtonClickedActionEvent(
      LoginLoginButtonClickedActionEvent event,
      Emitter<LoginState> emit) async {
    //!API_CALL
    emit(LoginLoginLoadingButtonState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginButtonClickedActionState());
  }

  FutureOr<void> loginPasswordShowButtonEvent(
      LoginPasswordShowButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginPasswordShowState());
  }

  FutureOr<void> loginPasswordHideButtonEvent(
      LoginPasswordHideButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginPasswordHideState());
  }
}
