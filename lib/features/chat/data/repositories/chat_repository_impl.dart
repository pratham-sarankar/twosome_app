import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/network/network_info.dart';
import 'package:twosome_app/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';
import 'package:twosome_app/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final NetworkInfo networkInfo;
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, List<ChatMessage>>> getMessages(
    String conversationId, {
    ChatMessage? lastMessage,
    int limit = 20,
  }) async {
    try {
      await _checkConnection();
      final result = await remoteDataSource.getMessages(
        conversationId,
        lastMessage: lastMessage,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(e is Failure ? e : ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
    String conversationId,
    String message,
    String senderId,
  ) async {
    try {
      await _checkConnection();
      final result = await remoteDataSource.sendMessage(
        conversationId,
        message,
        senderId,
      );
      return Right(result);
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
