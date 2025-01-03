import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import 'package:twosome_app/features/auth/domain/repositories/auth_repository.dart';

class DeleteUser extends UseCase<void, NoParams> {
  final AuthRepository repository;

  DeleteUser(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.deleteUser();
  }
}