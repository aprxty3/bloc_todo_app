import 'package:bloc_todo_app/core/use_case.dart';
import 'package:bloc_todo_app/domain/entities/todo_entry.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:bloc_todo_app/domain/repository/todo_repository.dart';
import 'package:either_dart/either.dart';

class LoadTodoEntry implements UseCase<TodoEntry, TodoEntryIdParam> {
  final ToDoRepository toDoRepository;

  LoadTodoEntry({required this.toDoRepository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdParam params) async {
    try {
      final loadedEntry =
          await toDoRepository.readTodoEntry(params.collections, params.id);
    return  loadedEntry.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
