import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/auth/resources/api_repo.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final ApiRepository apiRepository = ApiRepository();
  OtpBloc() : super(OtpInitialState()) {
    on<OtpVerifyButtonClickedActionEvent>(otpVerifyButtonClickedActionEvent);
  }

  FutureOr<void> otpVerifyButtonClickedActionEvent(
      OtpVerifyButtonClickedActionEvent event, Emitter<OtpState> emit) async {
    emit(OtpVerifyButtonLoadingState());
    //!API CAll
    BaseModel baseModel = await apiRepository.otpVerify(event.otp, event.email);

    if (baseModel.status) {
      emit(OtpVerifyButtonClickedActionState(message: baseModel.message));
    } else {
      emit(OtpVerifyErrorActionState(message: baseModel.message));
      emit(OtpInitialState());
    }
  }
}
