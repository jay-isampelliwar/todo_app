import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/auth/resources/api_provider.dart';
<<<<<<< HEAD
=======
import 'package:todo_app/features/auth/resources/api_repo.dart';
>>>>>>> 7ac6a43dbf1a9419fa88a657daf7690214d63101

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
<<<<<<< HEAD
  final ApiProvider _apiProvider = ApiProvider();
=======
  final ApiRepository _apiRepository = ApiRepository();
>>>>>>> 7ac6a43dbf1a9419fa88a657daf7690214d63101
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
<<<<<<< HEAD
    BaseModel baseModel = await _apiProvider.userRegister(
        event.name, event.email, event.phone, event.password);

    emit(SignUpShowSnackBarState(message: baseModel.message));
=======
    BaseModel baseModel = await _apiRepository.userRegister(
        event.name, event.email, event.password, event.phone);
    emit(SignUpHomePageNavigatorActionState());
>>>>>>> 7ac6a43dbf1a9419fa88a657daf7690214d63101
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
