import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Param> {
  @override
  Future<Either<Failure, Type>> call(Param param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
