import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';
import 'package:twosome_app/features/dots/domain/repositories/dot_repositories.dart';

class GetDots extends UseCase<List<Dot>, NoParams> {
  final DotRepository repository;

  GetDots(this.repository);

  @override
  Future<Either<Failure, List<Dot>>> call(NoParams params) async {
    return repository.getDots();
  }
}
