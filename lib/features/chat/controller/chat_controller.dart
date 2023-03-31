// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_chatapp/features/auth/controllers/auth_controllers.dart';
import 'package:flutter_chatapp/models/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_chatapp/features/chat/repository/chat_repository.dart';

import '../../../models/chat_contact.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContact>> chatContacts() {
    return chatRepository.getChatContacts();
  }

  Stream<List<Message>> getMessage(String receiverUserId) {
    return chatRepository.getChatMessagesStream(receiverUserId);
  }

  void sendTextMessage(
    BuildContext context,
    String receiverUserId,
    String text,
  ) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
            context: context,
            receiverUserId: receiverUserId,
            text: text,
            senderUser: value!,
          ),
        );
  }
}
