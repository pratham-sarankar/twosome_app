import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  FutureOr<Either<Failure, Type>> call(Params params);
}

class NoParams {}
