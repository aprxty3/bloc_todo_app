import 'package:bloc_todo_app/domain/entities/collection_id.dart';
import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/entities/todo_colors.dart';
import 'package:bloc_todo_app/domain/entities/todo_entry.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:bloc_todo_app/domain/repository/todo_repository.dart';
import 'package:either_dart/either.dart';

class TodoRepositoryMock implements ToDoRepository {
  final listCollection = List<TodoCollections>.generate(
    10,
    (index) => TodoCollections(
        id: CollectionId.fromUniqueString(index.toString()),
        colors: TodoColors(
          colorIndex: index % TodoColors.predefinedColors.length,
        ),
        titleName: 'titleName $index'),
  );

  final listEntry = List<TodoEntry>.generate(
    100,
    (index) => TodoEntry(
        id: EntryId.fromUniqueString(index.toString()),
        isDone: false,
        description: 'description $index'),
  );

  @override
  Future<Either<Failure, List<TodoCollections>>> readTodoCollections() {
    try {
      return Future.delayed(
        const Duration(seconds: 2),
        () => Right(listCollection),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entryId) {
    try {
      final selectedItem =
          listEntry.firstWhere((element) => element.id == entryId);

      return Future.delayed(
        const Duration(seconds: 2),
        () => Right(selectedItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readEntryById(
      CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryId =
          listEntry.sublist(startIndex, endIndex).map((e) => e.id).toList();

      return Future.delayed(
        const Duration(seconds: 4),
        () => Right(entryId),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }
}
