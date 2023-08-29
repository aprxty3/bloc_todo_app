part of 'todo_overview_cubit.dart';

sealed class TodoOverviewState extends Equatable {
  const TodoOverviewState();

  @override
  List<Object> get props => [];
}

class TodoOverviewInitial extends TodoOverviewState {}

class TodoOverviewStateLoading extends TodoOverviewState {}

class TodoOverviewStateLoaded extends TodoOverviewState {
  final List<TodoCollections> toDoCollections;

  const TodoOverviewStateLoaded({required this.toDoCollections});

  @override
  List<Object> get props => [toDoCollections];
}

class TodoOverviewStateError extends TodoOverviewState {}
