part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeTaskClickedActionState extends HomeActionState {}

class HomeTaskDoneButtonClickedState extends HomeState {}

class HomeTaskUndoneButtonClickedState extends HomeState {}

class HomeAddTaskButtonClickedActionState extends HomeActionState {}
