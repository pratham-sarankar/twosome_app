import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../../domain/entities/chat_message.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseFirestore _firestore;

  ChatBloc(this._firestore) : super(ChatInitial()) {
    on<LoadMessagesEvent>(_onLoadMessages);
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onLoadMessages(
    LoadMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());

    try {
      // Start listening to chat history
      final chatStream = _firestore
          .collection('ai_chat_rooms')
          .doc(event.aiModelType)
          .collection('chats')
          .doc(event.userId)
          .collection('chat_history')
          .orderBy('timestamp', descending: true)
          .limit(50)
          .snapshots();

      await emit.forEach(
        chatStream,
        onData: (QuerySnapshot snapshot) {
          final messages = snapshot.docs
              .map((doc) =>
                  ChatMessage.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
          return ChatLoaded(messages: messages);
        },
      );
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final chatRef = _firestore
          .collection('ai_chat_rooms')
          .doc(event.aiModelType)
          .collection('chats')
          .doc(event.userId)
          .collection('chat_history');

      // Add user message
      await chatRef.add({
        'content': event.message,
        'timestamp': DateTime.now(),
        'sender': 'user'
      });

      // AI response will be added through the stream
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}
