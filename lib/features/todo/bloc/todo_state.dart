part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

abstract class TodoActionState extends TodoState {}

class TodoInitial extends TodoState {}

class TodoButtonLoadingState extends TodoState {}

class TodoAddTaskButtonClickedActionState extends TodoActionState {}

class TodoCloseButtonClickedActionState extends TodoActionState {}

class TodoErrorActionState extends TodoActionState {
  String message;
  TodoErrorActionState({required this.message});
}

class TodoSuccessActionState extends TodoActionState {
  String message;
  TodoSuccessActionState({
    required this.message,
  });
}
