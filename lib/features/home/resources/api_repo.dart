import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';
import 'package:todo_app/features/home/resources/api_provider.dart';

class HomeApiRepository {
  final HomeApiProvider _homeApiProvider = HomeApiProvider();

  Future<TodoDataModel> getAllTask() {
    return _homeApiProvider.getAllTask();
  }

  Future<BaseModel> createTodo(String title) {
    return _homeApiProvider.createTodo(title);
  }

  Future<BaseModel> updateTodo(String title) {
    return _homeApiProvider.updateTodo(title);
  }

  Future<BaseModel> deleteTodo() {
    return _homeApiProvider.deleteTodo();
  }
}
