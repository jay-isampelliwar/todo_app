import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomePersonalCardClickedEvent>(homePersonalCardClickedEvent);
    on<HomeBusinessCardClickedEvent>(homeBusinessCardClickedEvent);
    on<HomeUrgentCardClickedEvent>(homeUrgentCardClickedEvent);
    on<HomeAllTaskCardClickedEvent>(homeAllTaskCardClickedEvent);
    on<HomeTaskDoneButtonClickedEvent>(homeTaskDoneButtonClickedEvent);
    on<HomeTaskUndoneButtonClickedEvent>(homeTaskUndoneButtonClickedEvent);
    on<HomeTaskClickedActionEvent>(homeTaskClickedActionEvent);
    on<HomeNewTaskAddEvent>(homeNewTaskAddEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingSuccessState());
  }

  FutureOr<void> homePersonalCardClickedEvent(
      HomePersonalCardClickedEvent event, Emitter<HomeState> emit) {
    emit(HomePersonalCardClickedState(text: "Personal Tasks"));
  }

  FutureOr<void> homeBusinessCardClickedEvent(event, Emitter<HomeState> emit) {
    emit(HomeBusinessCardClickedState(text: "Business Tasks"));
  }

  FutureOr<void> homeUrgentCardClickedEvent(
      HomeUrgentCardClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeUrgentCardClickedState(text: "Urgent Tasks"));
  }

  FutureOr<void> homeAllTaskCardClickedEvent(
      HomeAllTaskCardClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingSuccessState());
  }

  FutureOr<void> homeTaskDoneButtonClickedEvent(
      HomeTaskDoneButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeTaskUndoneButtonClickedEvent(
      HomeTaskUndoneButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeTaskClickedActionEvent(
      HomeTaskClickedActionEvent event, Emitter<HomeState> emit) {
    emit(HomeTaskClickedActionState());
  }

  FutureOr<void> homeNewTaskAddEvent(
      HomeNewTaskAddEvent event, Emitter<HomeState> emit) {}
}
