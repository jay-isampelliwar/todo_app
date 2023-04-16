import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/auth/resources/api_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ApiRepository _apiRepository = ApiRepository();

  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpInitialEvent>(signUpInitialEvent);

    on<SignUpButtonClickedActionEvent>(signUpButtonClickedActionEvent);
    on<SignUpLoginButtonClickedActionEvent>(
        signUpLoginButtonClickedActionEvent);
    on<SignUpPasswordShowButtonClickedEvent>(
        signUpPasswordShowButtonClickedEvent);
    on<SignUpPasswordHideButtonClickedEvent>(
        signUpPasswordHideButtonClickedEvent);
  }

  FutureOr<void> signUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitialState());
  }

  FutureOr<void> signUpButtonClickedActionEvent(
      SignUpButtonClickedActionEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpButtonLoadingState());

    BaseModel baseModel = await _apiRepository.userRegister(
        event.name, event.email, event.phone, event.password);

    if (baseModel.status == true) {
      emit(SignUpHomePageNavigatorActionState(message: baseModel.message));
    } else {
      emit(SignUpErrorState(message: baseModel.message));
      emit(SignUpInitialState());
    }
  }

  FutureOr<void> signUpLoginButtonClickedActionEvent(
      SignUpLoginButtonClickedActionEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoginNavigatorActionState());
  }

  FutureOr<void> signUpPasswordShowButtonClickedEvent(
      SignUpPasswordShowButtonClickedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordShowButtonClickedState());
  }

  FutureOr<void> signUpPasswordHideButtonClickedEvent(
      SignUpPasswordHideButtonClickedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordHideButtonClickedState());
  }
}
