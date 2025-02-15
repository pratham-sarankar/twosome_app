import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.id,
    required super.senderId,
    required super.message,
    required super.timestamp,
  });

  factory ChatMessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ChatMessageModel(
      id: snapshot.id,
      senderId: snapshot['senderId'],
      message: snapshot['message'],
      timestamp: (snapshot['timestamp'] as Timestamp).toDate(),
    );
  }
}
