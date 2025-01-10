import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String message;
  final Timestamp timestamp;
  final bool isRead;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  @override
  List<Object?> get props => [id];
}
