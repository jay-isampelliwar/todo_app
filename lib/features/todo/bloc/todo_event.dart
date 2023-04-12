part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoDateCardButtonClickedActionEvent extends TodoEvent {}

class TodoTimeCardButtonClickedActionEvent extends TodoEvent {}

class TodoBusinessChipSelectEvent extends TodoEvent {}

class TodoPersonalChipSelectEvent extends TodoEvent {}

class TodoUrgentChipSelectEvent extends TodoEvent {}

class TodoAddTaskButtonClickedActionEvent extends TodoEvent {}

class TodoCloseButtonClickedActionEvent extends TodoEvent {}
