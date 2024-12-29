import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SignOut implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.signOut();
  }
}
