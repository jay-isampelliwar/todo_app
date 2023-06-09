import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';
import 'package:uuid/uuid.dart';

class HomeApiProvider {
  String baseUrl = "https://todo-n03l.onrender.com";
  final client = http.Client();
  final hiveBox = Hive.box("data_box");

  String _getToken() {
    return hiveBox.get('Token');
  }

  List<String> _getLoginDetails() {
    return [hiveBox.get('Email'), hiveBox.get('Password')];
  }

  //get all task
  Future<TodoDataModel> getAllTask() async {
    var uri = Uri.parse("$baseUrl/todo/getTasks");

    try {
      var response = await client
          .get(uri, headers: {"Authorization": "Bearer ${_getToken()}"});
      return todoDataModelFromJson(response.body);
    } catch (e) {
      return TodoDataModel(status: false, data: []);
    }
  }

  //create task
  Future<BaseModel> createTodo(String title) async {
    var uri = Uri.parse("$baseUrl/todo/create");
    try {
      var response = await client.post(uri,
          body: {"title": title, "id": const Uuid().v4().toString()},
          headers: {"Authorization": "Bearer ${_getToken()}"});

      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(message: e.toString(), status: false);
    }
  }

  //update
  Future<BaseModel> updateTodo(String title, String id) async {
    var uri = Uri.parse("$baseUrl/todo/update");
    try {
      var response = await client.put(uri,
          body: {"title": title, "id": id},
          headers: {"Authorization": "Bearer ${_getToken()}"});
      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(message: e.toString(), status: false);
    }
  }

  //delete
  Future<BaseModel> deleteTodo(id) async {
    var uri = Uri.parse("$baseUrl/todo/delete");
    try {
      var response = await client.delete(uri,
          body: {"id": id},
          headers: {"Authorization": "Bearer ${_getToken()}"});

      return baseModelFromJson(response.body);
    } catch (e) {
      return BaseModel(message: e.toString(), status: false);
    }
  }
}
