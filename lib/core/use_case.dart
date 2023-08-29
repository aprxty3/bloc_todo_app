import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../domain/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {
  
}

class NoParam extends Params {
  @override
  List<Object> get props => [];
}