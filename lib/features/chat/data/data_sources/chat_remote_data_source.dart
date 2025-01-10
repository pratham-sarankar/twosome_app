import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twosome_app/core/errors/failures.dart';
import 'package:twosome_app/features/chat/data/models/chat_message_model.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatMessageModel>> getMessages(
    String conversationId, {
    ChatMessage? lastMessage,
    int limit = 20,
  });

  Future<void> sendMessage(
    String conversationId,
    String message,
    String senderId,
  );
}

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final FirebaseFirestore firestore;

  ChatRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ChatMessageModel>> getMessages(
    String conversationId, {
    ChatMessage? lastMessage,
    int limit = 20,
  }) async {
    try {
      final query = firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .limit(limit);
      if (lastMessage != null) {
        final lastDocument = await firestore
            .collection('conversations')
            .doc(conversationId)
            .collection('messages')
            .doc(lastMessage.id)
            .get();
        query.startAfterDocument(lastDocument);
      }
      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => ChatMessageModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw ServerFailure('Failed to fetch messages');
    }
  }

  @override
  Future<void> sendMessage(
    String conversationId,
    String message,
    String senderId,
  ) async {
    try {
      final collection = firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages');

      await collection.add({
        'senderId': senderId,
        'message': message,
        'timestamp': Timestamp.now(),
        'isRead': false,
      });
    } catch (e) {
      throw ServerFailure('Failed to send message');
    }
  }
}
