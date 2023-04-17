part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeUpdatePageEvent extends HomeEvent {
  Datum todo;
  HomeUpdatePageEvent({required this.todo});
}

class HomeTaskClickedActionEvent extends HomeEvent {}

class HomeTaskDeleteEvent extends HomeEvent {
  Datum todo;
  HomeTaskDeleteEvent({
    required this.todo,
  });
}

class HomeNewTaskAddEvent extends HomeEvent {}
