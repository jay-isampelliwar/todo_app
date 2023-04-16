part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeTaskClickedActionEvent extends HomeEvent {}

class HomeTaskDoneButtonClickedEvent extends HomeEvent {}

class HomeTaskUndoneButtonClickedEvent extends HomeEvent {}

class HomeNewTaskAddEvent extends HomeEvent {}
