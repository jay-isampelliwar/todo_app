import 'package:todo_app/features/auth/login/model/login_data_model.dart';

import '../../../core/model/base_data_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<BaseModel> userRegister(String name, email, phone, password) {
    return _apiProvider.userRegister(
      email: email,
      name: name,
      password: password,
      phone: phone,
    );
  }

  Future<LoginDataModel> userLogin(String email, password) {
    return _apiProvider.userLogin(email: email, password: password);
  }

  Future<BaseModel> userForgetPassword(String email) {
    return _apiProvider.userForgetPassword(email: email);
  }

  Future<BaseModel> otpVerify(String otp, String email) {
    return _apiProvider.otpVerify(otp: otp, email: email);
  }
}
