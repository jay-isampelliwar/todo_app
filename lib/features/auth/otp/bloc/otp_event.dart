part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OtpVerifyButtonClickedActionEvent extends OtpEvent {
  String otp;
  String email;
  OtpVerifyButtonClickedActionEvent({
    required this.otp,
    required this.email,
  });
}
