import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.dot});

  final Dot dot;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.dot.imageUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.dot.name),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: true,
                itemCount: messages.length,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                itemBuilder: (context, index) {
                  final sent = index % 2 == 0;
                  return Row(
                    mainAxisAlignment:
                        sent ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 0.65,
                          ),
                          padding: EdgeInsets.only(
                            right: sent ? 15 : 15,
                            left: sent ? 15 : 15,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: sent
                                ? Theme.of(context).colorScheme.primaryFixed
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(sent ? 18 : 0),
                              topRight: Radius.circular(sent ? 0 : 18),
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            alignment: WrapAlignment.end,
                            spacing: 10,
                            children: [
                              Text(
                                messages[index],
                                style: GoogleFonts.poppins(
                                  color: sent ? Colors.white : null,
                                ),
                              ),
                              Text(
                                "12:00",
                                style: GoogleFonts.poppins(
                                  color: sent ? Colors.white : null,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(),
                        ),
                      ),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filled(
                    icon: const Icon(IconlyLight.send),
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> messages = [
    'Hey',
    'Hello',
    'How are you?',
    'I am fine',
    'What about you?',
    'I am good',
    'How is your day going on?',
    'It is going great, thanks for asking, what about you?',
    'Mine is also going great'
  ].reversed.toList();
}
