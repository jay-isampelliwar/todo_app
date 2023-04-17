import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/helper/token.dart';
import 'package:todo_app/core/model/base_data_model.dart';
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
    on<LoginForgetPasswordActionEvent>(loginForgetPasswordActionEvent);
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
      appLoginToken = loginDataModel.token;
      emit(LoginHomePageNavigateActionState());
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

  FutureOr<void> loginForgetPasswordActionEvent(
      LoginForgetPasswordActionEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoginLoadingButtonState());
    BaseModel baseModel = await _apiRepository.userForgetPassword(
      event.email,
      event.password,
    );

    if (baseModel.status) {
      emit(LoginLoadingSuccessState(message: baseModel.message));
      emit(LoginInitialState());
    } else {
      emit(LoginErrorState(message: baseModel.message));
    }
  }
}
