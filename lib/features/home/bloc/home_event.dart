part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeUpdatePageEvent extends HomeEvent {
  Datum todo;
  HomeUpdatePageEvent({required this.todo});
}

class HomeAddTaskButtonClickedActionEvent extends HomeEvent {}

class HomeTaskClickedActionEvent extends HomeEvent {
  Datum todo;
  HomeTaskClickedActionEvent({required this.todo});
}

class HomeTaskDeleteEvent extends HomeEvent {
  Datum todo;
  HomeTaskDeleteEvent({
    required this.todo,
  });
}

class HomeUserLoginEventEvent extends HomeEvent {}

class HomeNewTaskAddEvent extends HomeEvent {}

class HomeLogoutButtonClickedActionEvent extends HomeEvent {}
