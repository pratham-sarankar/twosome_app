import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;
 

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? '',
      senderId: json['senderId'] ?? '',
      message: json['message'] ?? '',
      timestamp: json['timestamp']?.toDate() ?? DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [id, senderId, message, timestamp];
}
