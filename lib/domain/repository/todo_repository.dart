import 'package:bloc_todo_app/domain/entities/collection_id.dart';
import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/entities/todo_entry.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:either_dart/either.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<TodoCollections>>> readTodoCollections();

  Future<Either<Failure, TodoEntry>> readTodoEntry(CollectionId collectionId, EntryId entryId);
}
