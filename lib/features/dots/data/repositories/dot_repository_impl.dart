import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/network/network_info.dart';
import 'package:twosome_app/features/dots/data/data_sources/dot_remote_data_source.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';
import 'package:twosome_app/features/dots/domain/repositories/dot_repositories.dart';

class DotRepositoryImpl implements DotRepository {
  final NetworkInfo networkInfo;
  final DotRemoteDataSource remoteDataSource;

  DotRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, List<Dot>>> getDots() async {
    try {
      await _checkConnection();
      final dotModels = await remoteDataSource.getDots();
      return Right(dotModels);
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
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
