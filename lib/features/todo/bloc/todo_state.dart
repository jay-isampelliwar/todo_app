part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

abstract class TodoActionState {}

class TodoInitial extends TodoState {}

class TodoDateCardButtonClickedActionState extends TodoActionState {}

class TodoTimeCardButtonClickedActionState extends TodoActionState {}

class TodoBusinessChipSelectState extends TodoState {}

class TodoPersonalChipSelectState extends TodoState {}

class TodoUrgentChipSelectState extends TodoState {}

class TodoAddTaskButtonClickedActionState extends TodoActionState {}

class TodoCloseButtonClickedActionState extends TodoActionState {}
