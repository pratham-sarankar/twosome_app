import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

// When user sends a new message
class SendMessageEvent extends ChatEvent {
  final String message;
  final String aiModelType;
  final String userId;

  const SendMessageEvent({
    required this.message,
    required this.aiModelType,
    required this.userId,
  });

  @override
  List<Object?> get props => [message, aiModelType, userId];
}

// When loading initial or more messages
class LoadMessagesEvent extends ChatEvent {
  final String aiModelType;
  final String userId;

  const LoadMessagesEvent({
    required this.aiModelType,
    required this.userId,
  });

  @override
  List<Object?> get props => [aiModelType, userId];
}

// When user starts typing
class StartTypingEvent extends ChatEvent {
  final String conversationId;
  final String userId;

  StartTypingEvent({
    required this.conversationId,
    required this.userId,
  });

  @override
  List<Object?> get props => [conversationId, userId];
}

// When user stops typing
class StopTypingEvent extends ChatEvent {
  final String conversationId;
  final String userId;

  StopTypingEvent({
    required this.conversationId,
    required this.userId,
  });

  @override
  List<Object?> get props => [conversationId, userId];
}

// When user deletes a message
class DeleteMessageEvent extends ChatEvent {
  final String messageId;
  final String conversationId;

  DeleteMessageEvent({
    required this.messageId,
    required this.conversationId,
  });

  @override
  List<Object?> get props => [messageId, conversationId];
}

// When user edits a message
class EditMessageEvent extends ChatEvent {
  final String messageId;
  final String conversationId;
  final String newContent;

  EditMessageEvent({
    required this.messageId,
    required this.conversationId,
    required this.newContent,
  });

  @override
  List<Object?> get props => [messageId, conversationId, newContent];
}

// When user reacts to a message
class ReactToMessageEvent extends ChatEvent {
  final String messageId;
  final String conversationId;
  final String reaction;

  ReactToMessageEvent({
    required this.messageId,
    required this.conversationId,
    required this.reaction,
  });

  @override
  List<Object?> get props => [messageId, conversationId, reaction];
}

// When user opens media picker
class OpenMediaPickerEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}

// When user sends media
class SendMediaMessageEvent extends ChatEvent {
  final String conversationId;
  final String senderId;
  final String mediaType; // 'image', 'video', 'audio', etc.
  final String mediaPath;
  final String? caption;

  SendMediaMessageEvent({
    required this.conversationId,
    required this.senderId,
    required this.mediaType,
    required this.mediaPath,
    this.caption,
  });

  @override
  List<Object?> get props =>
      [conversationId, senderId, mediaType, mediaPath, caption];
}

// When user marks messages as read
class MarkMessagesAsReadEvent extends ChatEvent {
  final String conversationId;
  final List<String> messageIds;

  MarkMessagesAsReadEvent({
    required this.conversationId,
    required this.messageIds,
  });

  @override
  List<Object?> get props => [conversationId, messageIds];
}

// When user searches in chat
class SearchChatEvent extends ChatEvent {
  final String conversationId;
  final String searchQuery;

  SearchChatEvent({
    required this.conversationId,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [conversationId, searchQuery];
}

// When user blocks/reports another user
class ReportUserEvent extends ChatEvent {
  final String userId;
  final String reason;

  ReportUserEvent({
    required this.userId,
    required this.reason,
  });

  @override
  List<Object?> get props => [userId, reason];
}

// When user clears chat history
class ClearChatHistoryEvent extends ChatEvent {
  final String conversationId;

  ClearChatHistoryEvent({
    required this.conversationId,
  });

  @override
  List<Object?> get props => [conversationId];
}

// When user mutes/unmutes conversation
class ToggleMuteConversationEvent extends ChatEvent {
  final String conversationId;
  final bool isMuted;

  ToggleMuteConversationEvent({
    required this.conversationId,
    required this.isMuted,
  });

  @override
  List<Object?> get props => [conversationId, isMuted];
}

// When user pins/unpins a message
class TogglePinMessageEvent extends ChatEvent {
  final String messageId;
  final String conversationId;
  final bool isPinned;

  TogglePinMessageEvent({
    required this.messageId,
    required this.conversationId,
    required this.isPinned,
  });

  @override
  List<Object?> get props => [messageId, conversationId, isPinned];
}

// When user forwards a message
class ForwardMessageEvent extends ChatEvent {
  final String messageId;
  final String sourceConversationId;
  final String targetConversationId;

  ForwardMessageEvent({
    required this.messageId,
    required this.sourceConversationId,
    required this.targetConversationId,
  });

  @override
  List<Object?> get props =>
      [messageId, sourceConversationId, targetConversationId];
}
