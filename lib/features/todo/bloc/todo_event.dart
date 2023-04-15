part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoAddTaskButtonClickedActionEvent extends TodoEvent {}

class TodoCloseButtonClickedActionEvent extends TodoEvent {}
