import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatMessage>>> getMessages(
    String conversationId, {
    ChatMessage? lastMessage,
    int limit = 20,
  });

  Future<Either<Failure, void>> sendMessage(
    String conversationId,
    String message,
    String senderId,
  );
}
