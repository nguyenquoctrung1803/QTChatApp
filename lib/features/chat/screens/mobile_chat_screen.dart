import 'package:flutter/material.dart';
import 'package:flutter_chatapp/common/widgets/loading_screen.dart';
import 'package:flutter_chatapp/features/auth/controllers/auth_controllers.dart';
import 'package:flutter_chatapp/models/user_models.dart';
import 'package:flutter_chatapp/utils/colors.dart';
import 'package:flutter_chatapp/features/chat/widget/chat_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/bottom_chat_field.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  const MobileChatScreen({super.key, required this.name, required this.uid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
          stream: ref.read(authControllerProvider).userDataById(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }
            return Column(
              children: [
                Text(
                  name,
                ),
                Text(
                  snapshot.data!.isOnline ? 'Online' : 'Offline',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            );
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              receiverUserId: uid,
            ),
          ),
          BottomChatField(uid),
        ],
      ),
    );
  }
}
