import 'package:bloc_todo_app/domain/entities/collection_id.dart';
import 'package:either_dart/either.dart';

import '../../core/use_case.dart';
import '../failures/failure.dart';
import '../repository/todo_repository.dart';

class LoadTodoEntryById implements UseCase<List<EntryId>, TodoEntryByIdParam> {
  final ToDoRepository toDoRepository;

  LoadTodoEntryById({required this.toDoRepository});

  @override
  Future<Either<Failure, List<EntryId>>> call(TodoEntryByIdParam params) async {
    try {
      final todoEntryById = toDoRepository.readEntryById(
        params.collections,
      );
      return todoEntryById.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
