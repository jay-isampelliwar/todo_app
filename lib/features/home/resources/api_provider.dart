import 'package:http/http.dart' as http;
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/home/model/todo_data_model.dart';

class HomeApiProvider {
  String baseUrl = "http://3001";
  final client = http.Client();

  //get all task

  Future<TodoListModel> getAllTask() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoListModel(data: [Datum(id: "dd")]);
  }

  // get business task
  Future<TodoListModel> getBusiness() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoListModel(data: [Datum(id: "dd")]);
  }

  // get personal task
  Future<TodoListModel> getPersonal() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoListModel(data: [Datum(id: "dd")]);
  }

  // get urgent task
  Future<TodoListModel> getUrgent() async {
    var uri = Uri.parse("$baseUrl/tasks");
    try {} catch (e) {}
    return TodoListModel(data: [Datum(id: "dd")]);
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
