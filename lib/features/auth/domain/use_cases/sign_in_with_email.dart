import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithEmail implements UseCase<User, SignInWithEmailParams> {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInWithEmailParams params) {
    return repository.signInWithEmail(params.email, params.password);
  }
}

class SignInWithEmailParams {
  final String email;
  final String password;

  SignInWithEmailParams({required this.email, required this.password});
}
