import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:either_dart/either.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<TodoCollections>>> readTodoCollections();
}
