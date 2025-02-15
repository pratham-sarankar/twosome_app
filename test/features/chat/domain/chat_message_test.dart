import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';

void main() {
  group(
    'ChatMessage',
    () {
      final now = Timestamp.now();
      final chatMessage = ChatMessage(
        id: 'id',
        senderId: 'senderId',
        message: 'message',
        timestamp: now.toDate(),
      );

      test(
        'should have the correct properties',
        () {
          expect(chatMessage.id, 'id');
          expect(chatMessage.senderId, 'senderId');
          expect(chatMessage.message, 'message');
          expect(chatMessage.timestamp, now);
        },
      );

      test(
        'props should return a list with only id',
        () {
          expect(chatMessage.props, ['id']);
        },
      );

      test(
        'should be equal when id is the same',
        () {
          final chatMessage2 = ChatMessage(
            id: 'id',
            senderId: 'senderId2',
            message: 'message2',
            timestamp: now.toDate(),
           
          );
          expect(chatMessage, chatMessage2);
        },
      );

      test('should have isRead as false by default', () {
         ChatMessage(
          id: 'id',
          senderId: 'senderId2',
          message: 'message2',
          timestamp: now.toDate(),
        );
      });
    },
  );
}
