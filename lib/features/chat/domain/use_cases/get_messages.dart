import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';
import 'package:twosome_app/features/chat/domain/repositories/chat_repository.dart';

class GetMessages implements UseCase<List<ChatMessage>, GetMessageParams> {
  final ChatRepository chatRepository;

  GetMessages(this.chatRepository);

  @override
  FutureOr<Either<Failure, List<ChatMessage>>> call(
      GetMessageParams params) async {
    return chatRepository.getMessages(
      params.conversationId,
      lastMessage: params.startAfter,
      limit: params.limit,
    );
  }
}

class GetMessageParams {
  final String conversationId;
  final int limit;
  final ChatMessage startAfter;

  GetMessageParams({
    required this.conversationId,
    required this.limit,
    required this.startAfter,
  });
}
