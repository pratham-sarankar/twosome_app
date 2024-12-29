import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/network/network_info.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final auth.FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl(
    this.networkInfo, {
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<Either<Failure, User>> signInWithEmail(
      String email, String password) async {
    try {
      await _checkConnection();
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return Right(UserModel(id: user.uid, email: user.email ?? ''));
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
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return Right(UserModel(id: user.uid, email: user.email ?? ''));
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
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(AuthFailure('Google sign-in aborted'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        return Right(UserModel(id: user.uid, email: user.email ?? ''));
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
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        return Right(UserModel(id: user.uid, email: user.email ?? ''));
      } else {
        return Left(AuthFailure('No user currently signed in'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
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
