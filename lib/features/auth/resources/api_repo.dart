import 'package:todo_app/features/auth/login/model/login_data_model.dart';

import '../../../core/model/base_data_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<BaseModel> userRegister(String name, email, phone, password) {
    return _apiProvider.userRegister(name, email, phone, password);
  }

  Future<LoginDataModel> userLogin(String phone, password) {
    return _apiProvider.userLogin(phone, password);
  }

  Future<BaseModel> userForgetPassword(String phone) {
    return _apiProvider.userForgetPassword(phone);
  }

  Future<BaseModel> userUserDetails(String phone) {
    return _apiProvider.userDetails(phone);
  }
}
