// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chatapp/common/widgets/loading_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_chatapp/features/chat/controller/chat_controller.dart';
import 'package:flutter_chatapp/models/message.dart';
import 'package:flutter_chatapp/features/chat/widget/my_messages_card.dart';
import 'package:flutter_chatapp/features/chat/widget/sender_messages.dart';
import 'package:intl/intl.dart';

class ChatList extends ConsumerStatefulWidget {
  final String receiverUserId;
  const ChatList({Key? key, required this.receiverUserId}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream:
            ref.read(chatControllerProvider).getMessage(widget.receiverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageController
                .jumpTo(messageController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var messagesData = snapshot.data![index];
              String timeSent = DateFormat.Hm().format(messagesData.timeSent);
              if (messagesData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessagesCard(
                  message: messagesData.text,
                  date: timeSent,
                );
              }
              return SenderMessages(
                message: messagesData.text,
                date: timeSent,
              );
            },
          );
        });
  }
}
