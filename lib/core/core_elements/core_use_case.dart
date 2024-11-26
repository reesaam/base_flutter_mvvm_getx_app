import 'package:dartz/dartz.dart';

abstract class UseCase {}

abstract class UseCaseNoParams<E, D> extends UseCase {
  Future<Either<E, D>> call();
}

///UseCase Class
abstract class UseCaseWithParams<E, D, P> extends UseCase {
  Future<Either<E, D>> call(P params);
}
