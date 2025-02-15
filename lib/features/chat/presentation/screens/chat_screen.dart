import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:twosome_app/features/auth/domain/entities/user.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';
import 'package:twosome_app/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bloc/chat_state.dart';
import '../bloc/chat_event.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.dot});

  final Dot dot;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final String aiModelType = widget.dot.professio;
  // final String userId = 'user_123'; // This should come from auth
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.dot.imageUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dot.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Show options menu
              showModalBottomSheet(
                context: context,
                builder: (context) => ChatOptionsSheet(),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // Add a subtle background pattern or gradient
          color: Theme.of(context).scaffoldBackgroundColor,
          image: DecorationImage(
            image: AssetImage(
                'assets/images/chat_background.png'), // Add this image
            opacity: 0.1,
            fit: BoxFit.cover,
          ),
        ),
        child: BlocProvider(
          create: (context) => ChatBloc(FirebaseFirestore.instance)
            ..add(LoadMessagesEvent(
              aiModelType: widget.dot.name,
              userId: "user",
            )),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ChatLoaded) {
                return Column(
                  children: [
                    // Typing indicator when AI is "thinking"
                    // if (state.isAiTyping) _buildTypingIndicator(),

                    Expanded(
                      child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: MessageBubble(message: message),
                            );
                          },
                        ),
                      ),
                    ),
                    _buildBottomBar(),
                  ],
                );
              }

              if (state is ChatError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error: ${state.message}',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ChatBloc>().add(
                                LoadMessagesEvent(
                                  aiModelType: widget.dot.name,
                                  userId: "User",
                                ),
                              );
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 48,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Start a conversation\nwith your AI companion',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: MessageInput(
            onSend: (message) {
              context.read<ChatBloc>().add(
                    SendMessageEvent(
                      message: message,
                      aiModelType: widget.dot.name,
                      userId: "user",
                    ),
                  );
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ChatOptionsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Clear chat history'),
            onTap: () {
              // Implement clear chat
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Change chat theme'),
            onTap: () {
              // Implement theme change
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('AI Assistant info'),
            onTap: () {
              // Show AI info
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
