part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitialState extends OtpState {}

class OtpActionState extends OtpState {}

class OtpVerifyButtonLoadingState extends OtpState {}

class OtpVerifyButtonClickedActionState extends OtpActionState {
  String message;
  OtpVerifyButtonClickedActionState({
    required this.message,
  });
}

class OtpVerifyErrorActionState extends OtpActionState {
  String message;
  OtpVerifyErrorActionState({
    required this.message,
  });
}
