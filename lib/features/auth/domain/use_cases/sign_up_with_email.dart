import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmail implements UseCase<User, SignUpWithEmailParams> {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpWithEmailParams params) {
    return repository.signUpWithEmail(params.email, params.password);
  }
}

class SignUpWithEmailParams {
  final String email;
  final String password;

  SignUpWithEmailParams({required this.email, required this.password});
}
