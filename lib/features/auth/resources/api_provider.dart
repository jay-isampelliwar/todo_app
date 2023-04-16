import 'package:http/http.dart' as http;
import 'package:todo_app/features/auth/login/model/login_data_model.dart';

import '../../../core/model/base_data_model.dart';

class ApiProvider {
  final String baseUrl = "https://cautious-duck-hospital-gown.cyclic.app";
  final client = http.Client();
  // register
  Future<BaseModel> userRegister(
      String name, String email, String phone, String password) async {
    // var header = {
    //   "Content-Type": "application/json",
    // };
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
      return BaseModel(message: "message", status: false);
    }
  }

  //login
  Future<LoginDataModel> userLogin(String phone, String password) async {
    var uri = Uri.parse("$baseUrl/user/login");
    return LoginDataModel(token: "Token", status: false, message: "");
  }

  // forget password
  Future<BaseModel> userForgetPassword(String phone) async {
    var uri = Uri.parse("$baseUrl/user/register");
    return BaseModel(message: "message", status: false);
  }

  // user details
  Future<BaseModel> userDetails(String phone) async {
    var uri = Uri.parse("$baseUrl/user");
    return BaseModel(message: "message", status: false);
  }
}
