import 'package:http/http.dart' as http;
import 'package:todo_app/features/auth/login/model/login_data_model.dart';

import '../../../core/model/base_data_model.dart';

class ApiProvider {
  final String baseUrl = "https://todo-n03l.onrender.com";
  final client = http.Client();
  // register
  Future<BaseModel> userRegister(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    var uri = Uri.parse("$baseUrl/user/register");
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
    try {
      var response = await client.post(uri, body: body);
      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(message: e.toString(), status: false);
    }
  }

  //login
  Future<LoginDataModel> userLogin({required password, required email}) async {
    var uri = Uri.parse("$baseUrl/user/login");
    var body = {"email": email, "password": password};
    try {
      var response = await client.post(uri, body: body);
      return loginDataModelFromJson(response.body);
    } catch (e) {
      return LoginDataModel(status: false, message: e.toString(), token: "");
    }
  }

  // forget password
  Future<BaseModel> userForgetPassword(
      {required String email, required String newPassword}) async {
    var uri = Uri.parse("$baseUrl/user/forget_password");
    try {
      var response = await client
          .post(uri, body: {"email": email, "newPassword": newPassword});
      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(status: false, message: e.toString());
    }
  }

  Future<BaseModel> otpVerify(
      {required String otp, required String email}) async {
    var uri = Uri.parse("$baseUrl/user/verifyOTP");
    var body = {
      "otp": otp,
      "email": email,
    };

    try {
      var response = await client.post(uri, body: body);
      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(message: e.toString(), status: false);
    }
  }
}
