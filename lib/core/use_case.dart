import 'package:bloc_todo_app/domain/entities/collection_id.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../domain/failures/failure.dart';

abstract class Params extends Equatable {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam extends Params {
  @override
  List<Object> get props => [];
}

class TodoEntryIdParam extends Params {
  TodoEntryIdParam({required this.id, required this.collections}) : super();
  final EntryId id;
  final CollectionId collections;

  @override
  List<Object?> get props => [id, collections];
}
