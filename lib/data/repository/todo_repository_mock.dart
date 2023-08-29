import 'package:bloc_todo_app/domain/entities/collection_id.dart';
import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:bloc_todo_app/domain/entities/todo_colors.dart';
import 'package:bloc_todo_app/domain/failures/failure.dart';
import 'package:bloc_todo_app/domain/repository/todo_repository.dart';
import 'package:either_dart/either.dart';

class TodoRepositoryMock implements ToDoRepository {
  @override
  Future<Either<Failure, List<TodoCollections>>> readTodoCollections() {
    final list = List<TodoCollections>.generate(
      10,
      (index) => TodoCollections(
          id: CollectionId.fromUniqueString(index.toString()),
          colors: TodoColors(
            colorIndex: index % TodoColors.predefinedColors.length,
          ),
          titleName: 'titleName $index'),
    );

    return Future.delayed(
      const Duration(seconds: 2),
      () => Right<Failure, List<TodoCollections>>(list),
    );
  }
}
