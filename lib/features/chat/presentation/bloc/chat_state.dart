part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  final List<ChatMessage> messages;

  const ChatState(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatInitial extends ChatState {
  const ChatInitial(super.messages);
}

class ChatLoading extends ChatState {
  ChatLoading() : super([]);
}

class ChatLoadingMore extends ChatState {
  const ChatLoadingMore(super.messages);
}

class ChatSendingMessage extends ChatState {
  const ChatSendingMessage(super.messages);
}

class ChatLoaded extends ChatState {
  final bool hasMore;

  const ChatLoaded(super.messages, {this.hasMore = true});

  @override
  List<Object> get props => [messages, hasMore];
}

class ChatError extends ChatState {
  final String message;

  const ChatError(super.messages, {required this.message});

  @override
  List<Object> get props => [message, messages];
}

class ChatLoadingMoreError extends ChatState {
  final String message;
  final bool hasMore;

  const ChatLoadingMoreError(
    super.messages, {
    required this.message,
    this.hasMore = true,
  });

  @override
  List<Object> get props => [message, hasMore, messages];
}
