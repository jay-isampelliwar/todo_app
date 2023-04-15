import 'package:http/http.dart' as http;
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';

class HomeApiProvider {
  String baseUrl = "http://3001";
  final client = http.Client();

  //get all task

  Future<TodoDataModel> getAllTask() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoDataModel(data: [Datum(id: "dd")], status: false);
  }

  // get business task
  Future<TodoDataModel> getBusiness() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoDataModel(data: [Datum(id: "dd")], status: false);
  }

  // get personal task
  Future<TodoDataModel> getPersonal() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoDataModel(data: [Datum(id: "dd")], status: false);
  }

  // get urgent task
  Future<TodoDataModel> getUrgent() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoDataModel(data: [Datum(id: "dd")], status: false);
  }

  //create task
  Future<BaseModel> createTodo(String title) async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return BaseModel(message: "message");
  }

  //update
  Future<BaseModel> updateTodo(String title) async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return BaseModel(message: "message");
  }

  //delete
  Future<BaseModel> deleteTodo() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return BaseModel(message: "message");
  }
}
