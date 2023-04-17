part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoAddTaskButtonClickedActionEvent extends TodoEvent {
  String title;
  TodoAddTaskButtonClickedActionEvent({required this.title});
}

class TodoUpdateTaskButtonClickedActionEvent extends TodoEvent {
  String title;
  String id;
  TodoUpdateTaskButtonClickedActionEvent({
    required this.title,
    required this.id,
  });
}

class TodoCloseButtonClickedActionEvent extends TodoEvent {}
