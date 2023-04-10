part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomePersonalCardClickedEvent extends HomeEvent {}

class HomBusinessCardClickedEvent extends HomeEvent {}

class HomeUrgentCardClickedEvent extends HomeEvent {}

class HomeDrawerButtonClickedEvent extends HomeEvent {}

class HomeTaskDoneButtonClickedEvent extends HomeEvent {}

class HomeTaskUndoneButtonClickedEvent extends HomeEvent {}

class HomeTaskClickedEvent extends HomeEvent {}

class HomeNewTaskAddEvent extends HomeEvent {}
