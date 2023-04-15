import 'package:http/http.dart' as http;
import 'package:todo_app/features/auth/login/model/login_data_model.dart';

import '../../../core/model/base_data_model.dart';

class ApiProvider {
  final String baseUrl = "http://3001";
  final client = http.Client();
  // register
  Future<BaseModel> userRegister(
      String name, String email, String phone, String password) async {
    var uri = Uri.parse("$baseUrl/user/register");

    try {
      // var response = await client.post();
    } catch (e) {}
    return BaseModel(message: "message", status: false);
  }

  //login
  Future<LoginDataModel> userLogin(String phone, String password) async {
    var uri = Uri.parse("$baseUrl/user/register");
    return LoginDataModel(token: "Token", status: false, message: "");
  }

  // forget password
  Future<BaseModel> userForgetPassword(String phone) async {
    var uri = Uri.parse("$baseUrl/user/register");
    return BaseModel(message: "message", status: false);
  }

  // user details
  Future<BaseModel> userDetails(String phone) async {
    var uri = Uri.parse("$baseUrl/user/register");
    return BaseModel(message: "message", status: false);
  }
}
