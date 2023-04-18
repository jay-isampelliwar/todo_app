part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  List<Datum> todoList;
  HomeLoadingSuccessState({
    required this.todoList,
  });
}

class HomeSuccessActionState extends HomeActionState {
  String message;
  HomeSuccessActionState({
    required this.message,
  });
}

class HomeErrorActionState extends HomeActionState {
  String message;
  HomeErrorActionState({
    required this.message,
  });
}

class HomeTaskClickedActionState extends HomeActionState {
  Datum todo;
  HomeTaskClickedActionState({required this.todo});
}

class HomeTaskDoneButtonClickedState extends HomeState {}

class HomeTaskUndoneButtonClickedState extends HomeState {}

class HomeAddTaskButtonClickedActionState extends HomeActionState {}

class HomeLoginNavigatorActionState extends HomeActionState {}
