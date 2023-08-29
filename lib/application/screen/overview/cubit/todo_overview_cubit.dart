import 'package:bloc/bloc.dart';
import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/use_case/load_todo_collection.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/use_case.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  TodoOverviewCubit(
      {required this.loadToDoCollections, TodoOverviewState? initialState})
      : super(initialState ?? TodoOverviewStateLoading());
  final LoadToDoCollections loadToDoCollections;

  Future<void> readCollection() async {
    emit(TodoOverviewStateLoading());
    try {
      final collections = await loadToDoCollections.call(NoParam());

      if (collections.isLeft) {
        emit(TodoOverviewStateError());
      } else {
        emit(TodoOverviewStateLoaded(toDoCollections: collections.right));
      }
    } on Exception {
      emit(TodoOverviewStateError());
    }
  }
}
