import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/network/network_info.dart';
import 'package:twosome_app/features/auth/data/data_sources/auth_remote_data_source.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.networkInfo,
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, User>> signInWithEmail(
      String email, String password) async {
    try {
      await _checkConnection();
      final user = await remoteDataSource.signInWithEmail(email, password);
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(AuthFailure('User not found'));
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error'));
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      String email, String password) async {
    try {
      await _checkConnection();
      final user = await remoteDataSource.signUpWithEmail(email, password);
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(AuthFailure('User not found'));
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error'));
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      await _checkConnection();
      final user = await remoteDataSource.signInWithGoogle();
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(AuthFailure('User not found'));
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error'));
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Either<Failure, User> getCurrentUser() {
    try {
      final user = remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(UserModel.fromFirebaseUser(user));
      } else {
        return Left(AuthFailure('No user currently signed in'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await _checkConnection();
      return Right(await remoteDataSource.sendPasswordResetEmail(email));
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication error'));
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    _checkConnection();
    auth.User? user = remoteDataSource.getCurrentUser();
    if (user != null) {
      try {
        await user.delete();
        return const Right(null);
      } on auth.FirebaseAuthException catch (e) {
        return Left(AuthFailure(e.message ?? 'Authentication error'));
      }
    } else {
      return Left(AuthFailure('No user currently signed in'));
    }
  }

  /// Check if there is an internet connection
  ///
  /// Throws a [NetworkFailure] if there is no internet connection
  Future<bool> _checkConnection() async {
    if (!await networkInfo.isConnected) {
      throw NetworkFailure("No internet connection");
    }
    return true;
  }
}
