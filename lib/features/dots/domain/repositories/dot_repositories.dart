import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

abstract class DotRepository {
  Future<Either<Failure, List<Dot>>> getDots();
}
