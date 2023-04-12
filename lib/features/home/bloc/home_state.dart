part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeBusinessCardClickedState extends HomeState {
  final String text;
  HomeBusinessCardClickedState({
    required this.text,
  });
}

class HomePersonalCardClickedState extends HomeState {
  final String text;
  HomePersonalCardClickedState({required this.text});
}

class HomeUrgentCardClickedState extends HomeState {
  final String text;
  HomeUrgentCardClickedState({
    required this.text,
  });
}

class HomeAllTaskCardClickedState extends HomeState {}

class HomeTaskClickedActionState extends HomeActionState {}

class HomeTaskDoneButtonClickedState extends HomeState {}

class HomeTaskUndoneButtonClickedState extends HomeState {}

class HomeAddTaskButtonClickedActionState extends HomeActionState {}
