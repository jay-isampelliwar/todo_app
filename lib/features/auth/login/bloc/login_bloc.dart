import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/auth/login/model/login_data_model.dart';
import 'package:todo_app/features/auth/resources/api_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository _apiRepository = ApiRepository();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginSignUpNavigateActionEvent>(loginSignUpNavigateActionEvent);
    on<LoginLoginButtonClickedActionEvent>(loginLoginButtonClickedActionEvent);
    on<LoginPasswordShowButtonEvent>(loginPasswordShowButtonEvent);
    on<LoginPasswordHideButtonEvent>(loginPasswordHideButtonEvent);
    on<LoginForgetPasswordButtonClickedActionEvent>(
        loginForgetPasswordButtonClickedActionEvent);
  }

  FutureOr<void> loginSignUpNavigateActionEvent(
      LoginSignUpNavigateActionEvent event, Emitter<LoginState> emit) {
    emit(LoginSignUpNavigateActionState());
  }

  FutureOr<void> loginLoginButtonClickedActionEvent(
      LoginLoginButtonClickedActionEvent event,
      Emitter<LoginState> emit) async {
    emit(LoginLoginLoadingButtonState());
    LoginDataModel loginDataModel =
        await _apiRepository.userLogin(event.email, event.password);

    if (loginDataModel.status && loginDataModel.token.isNotEmpty) {
      emit(LoginHomePageNavigateActionState(message: loginDataModel.message));
    } else {
      emit(LoginErrorState(message: loginDataModel.message));
      emit(LoginInitialState());
    }
  }

  FutureOr<void> loginPasswordShowButtonEvent(
      LoginPasswordShowButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginPasswordShowState());
  }

  FutureOr<void> loginPasswordHideButtonEvent(
      LoginPasswordHideButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginPasswordHideState());
  }

  FutureOr<void> loginForgetPasswordButtonClickedActionEvent(
      LoginForgetPasswordButtonClickedActionEvent event,
      Emitter<LoginState> emit) {}
}
