import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twosome_app/features/chat/domain/entities/chat_message.dart';
import 'package:twosome_app/features/chat/domain/use_cases/get_messages.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessages getMessages;

  ChatBloc(this.getMessages) : super(ChatInitial([])) {
    on<LoadMessages>(_onLoadMessages, transformer: droppable());
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    final result = await getMessages
        .call(GetMessageParams(conversationId: event.conversationId));
    result.fold(
      (failure) {
        emit(ChatError([], message: failure.message));
      },
      (messages) => emit(ChatLoaded(messages)),
    );
  }
}
