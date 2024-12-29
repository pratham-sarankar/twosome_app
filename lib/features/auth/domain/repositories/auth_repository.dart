import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithEmail(String email, String password);

  Future<Either<Failure, User>> signUpWithEmail(String email, String password);

  Future<Either<Failure, User>> signInWithGoogle();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, User>> getCurrentUser();
}
