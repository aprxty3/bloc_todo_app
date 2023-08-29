import 'package:bloc_todo_app/core/use_case.dart';
import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:either_dart/either.dart';

import '../repository/todo_repository.dart';

class LoadToDoCollections implements UseCase<List<TodoCollections>, NoParam> {
  LoadToDoCollections({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<TodoCollections>>> call(NoParam params) async {
    try {
      final loadedCollections = toDoRepository.readTodoCollections();

      return loadedCollections.fold(
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
